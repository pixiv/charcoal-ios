import path from 'path'
import fs from 'fs/promises'
import { globby } from 'globby'
import { parseV1IconLayout } from '../parsers/v1IconLayoutParser.js'
import { parseV2IconLayout } from '../parsers/v2IconLayoutParser.js'
import { toImageSetOutput } from '../mappers/assetNameMapper.js'
import { ensureDir, removeDirIfExists } from '../utils/fs.js'

function createXCAssetInfoJSON() {
  return {
    info: {
      version: 1,
      author: 'pixiv',
    },
  }
}

function createPreservesVectorRepresentationJSON() {
  return {
    properties: {
      'preserves-vector-representation': true,
    },
  }
}

function createUniversalImageJson(filename) {
  return {
    images: [
      {
        idiom: 'universal',
        filename,
      },
    ],
    ...createXCAssetInfoJSON(),
    ...createPreservesVectorRepresentationJSON(),
  }
}

function parseLayout(version, inputDir, filePath) {
  if (version === 'v1') {
    return parseV1IconLayout(inputDir, filePath)
  }

  return parseV2IconLayout(inputDir, filePath)
}

export async function generateImageAssets(version, inputDir, outputDir) {
  await removeDirIfExists(outputDir)
  await ensureDir(outputDir)

  const matches = await globby([path.join(inputDir, '**/*.pdf')])
  for (const match of matches) {
    const parsed = parseLayout(version, inputDir, match)
    const mapped = toImageSetOutput(parsed, outputDir)

    await ensureDir(mapped.outputAssetDir)
    await fs.copyFile(parsed.sourcePath, mapped.outputPDFPath)
    await fs.writeFile(
      path.join(mapped.outputAssetDir, 'Contents.json'),
      JSON.stringify(createUniversalImageJson(parsed.filename)),
    )
  }
}
