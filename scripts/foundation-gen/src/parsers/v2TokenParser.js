import { promises as fs } from 'fs'

const REFERENCE_PATTERN = /^\{([^}]+)\}$/

function resolveReference(target, categoryName, key, visited = new Set()) {
  const token = target?.[categoryName]?.[key]
  if (!token) {
    throw new Error(`Token reference not found: ${categoryName}.${key}`)
  }

  const value = token.value
  if (typeof value !== 'string') {
    return value
  }

  const match = value.match(REFERENCE_PATTERN)
  if (!match) {
    return value
  }

  const ref = match[1]
  if (visited.has(ref)) {
    throw new Error(`Circular token reference detected: ${[...visited, ref].join(' -> ')}`)
  }

  const dotIndex = ref.indexOf('.')
  if (dotIndex < 0) {
    throw new Error(`Invalid token reference format: ${value}`)
  }

  const refCategory = ref.slice(0, dotIndex)
  const refKey = ref.slice(dotIndex + 1)
  return resolveReference(target, refCategory, refKey, new Set([...visited, ref]))
}

function resolveAllTokens(target) {
  const resolved = {}
  for (const [categoryName, tokens] of Object.entries(target)) {
    resolved[categoryName] = {}
    for (const key of Object.keys(tokens)) {
      resolved[categoryName][key] = {
        value: resolveReference(target, categoryName, key),
      }
    }
  }
  return resolved
}

async function readJSONIfPath(filePath) {
  if (!filePath) {
    return null
  }

  return JSON.parse(await fs.readFile(filePath, 'utf8'))
}

function mergeTokenTrees(...trees) {
  const merged = {}

  for (const tree of trees) {
    if (!tree || typeof tree !== 'object') {
      continue
    }

    for (const [categoryName, tokens] of Object.entries(tree)) {
      if (!tokens || typeof tokens !== 'object' || Array.isArray(tokens)) {
        continue
      }

      merged[categoryName] = {
        ...(merged[categoryName] ?? {}),
        ...tokens,
      }
    }
  }

  return merged
}

async function buildV2Target({
  legacyPath,
  appliedPath,
  primitivesPath,
}) {
  const legacy = await readJSONIfPath(legacyPath)
  const primitives = await readJSONIfPath(primitivesPath)
  const applied = await readJSONIfPath(appliedPath)

  return mergeTokenTrees(legacy, primitives, applied)
}

export async function parseV2Tokens({
  inputLight,
  inputDark,
  inputLightApplied,
  inputDarkApplied,
  inputLightPrimitives,
  inputDarkPrimitives,
}) {
  const light = await buildV2Target({
    legacyPath: inputLight,
    appliedPath: inputLightApplied,
    primitivesPath: inputLightPrimitives,
  })
  const dark = await buildV2Target({
    legacyPath: inputDark,
    appliedPath: inputDarkApplied,
    primitivesPath: inputDarkPrimitives,
  })

  return {
    version: 'v2',
    light: resolveAllTokens(light),
    dark: resolveAllTokens(dark),
  }
}
