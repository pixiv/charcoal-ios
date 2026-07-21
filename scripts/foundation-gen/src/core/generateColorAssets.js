import path from 'path'
import { promises as fs } from 'fs'
import { parseRGBA } from '../utils/color.js'
import { ensureDir, removeDirIfExists, writeJSON } from '../utils/fs.js'
import { toColorAssetRelativePath } from '../mappers/tokenKeyMapper.js'

function createXCAssetInfoJSON() {
  return {
    info: {
      version: 1,
      author: 'pixiv',
    },
  }
}

function createProvidesNamespaceJson() {
  return {
    ...createXCAssetInfoJSON(),
    properties: {
      'provides-namespace': true,
    },
  }
}

// Keep 0...1 fixed-point values to avoid Xcode occasionally interpreting `1` as 1/255.
function formatColorComponent(value) {
  return Number(value).toFixed(3)
}

function createColorJson(light, dark) {
  return {
    colors: [
      {
        color: {
          'color-space': 'srgb',
          components: {
            alpha: formatColorComponent(light.alpha),
            blue: formatColorComponent(light.blue),
            green: formatColorComponent(light.green),
            red: formatColorComponent(light.red),
          },
        },
        idiom: 'universal',
      },
      {
        appearances: [
          {
            appearance: 'luminosity',
            value: 'dark',
          },
        ],
        color: {
          'color-space': 'srgb',
          components: {
            alpha: formatColorComponent(dark.alpha),
            blue: formatColorComponent(dark.blue),
            green: formatColorComponent(dark.green),
            red: formatColorComponent(dark.red),
          },
        },
        idiom: 'universal',
      },
    ],
    ...createXCAssetInfoJSON(),
  }
}

async function writeNamespaceFiles(rootDir) {
  const directories = [rootDir]

  while (directories.length > 0) {
    const currentDir = directories.pop()
    const entries = await fs.readdir(currentDir, { withFileTypes: true })

    for (const entry of entries) {
      if (entry.isDirectory()) {
        const nextDir = path.join(currentDir, entry.name)
        directories.push(nextDir)
      }
    }

    if (currentDir !== rootDir) {
      const contentsPath = path.join(currentDir, 'Contents.json')
      try {
        await fs.access(contentsPath)
      } catch {
        await writeJSON(contentsPath, createProvidesNamespaceJson())
      }
    }
  }
}

async function generateV1ColorAssets(light, dark, colorAssetOutputDir) {
  const { color: colorsLight, gradientColor: gradientColorsLight } = light
  const { color: colorsDark, gradientColor: gradientColorsDark } = dark

  for (const name of Object.keys(colorsLight)) {
    const outputDir = path.join(colorAssetOutputDir, `${name}.colorset`)
    await ensureDir(outputDir)
    await writeJSON(path.join(outputDir, 'Contents.json'), createColorJson(colorsLight[name], colorsDark[name]))
  }

  for (const name of Object.keys(gradientColorsLight)) {
    for (const [index] of gradientColorsLight[name].entries()) {
      const gradientLight = gradientColorsLight[name][index]
      const gradientDark = gradientColorsDark[name][index]
      const outputDir = path.join(colorAssetOutputDir, `${name}_${gradientLight.ratio}.colorset`)
      await ensureDir(outputDir)
      await writeJSON(
        path.join(outputDir, 'Contents.json'),
        createColorJson(gradientLight.color, gradientDark.color),
      )
    }
  }
}

async function generateV2ColorAssets(lightTokens, darkTokens, colorAssetOutputDir) {
  const lightColors = lightTokens.color ?? {}
  const darkColors = darkTokens.color ?? {}

  for (const tokenKey of Object.keys(lightColors)) {
    const lightValue = lightColors[tokenKey]?.value
    const darkValue = darkColors[tokenKey]?.value
    if (typeof lightValue !== 'string' || typeof darkValue !== 'string') {
      continue
    }

    const relativePath = toColorAssetRelativePath(tokenKey)
    const outputDir = path.join(colorAssetOutputDir, ...relativePath) + '.colorset'
    await ensureDir(outputDir)
    await writeJSON(
      path.join(outputDir, 'Contents.json'),
      createColorJson(parseRGBA(lightValue), parseRGBA(darkValue)),
    )
  }

  await writeNamespaceFiles(colorAssetOutputDir)
}

export async function generateColorAssets(data, colorAssetOutputDir) {
  await removeDirIfExists(colorAssetOutputDir)
  await ensureDir(colorAssetOutputDir)

  if (data.version === 'v1') {
    await generateV1ColorAssets(data.light, data.dark, colorAssetOutputDir)
  } else {
    await generateV2ColorAssets(data.light, data.dark, colorAssetOutputDir)
  }

  await writeJSON(path.join(colorAssetOutputDir, 'Contents.json'), createXCAssetInfoJSON())
}
