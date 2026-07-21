import path from 'path'
import { globby } from 'globby'
import fs from 'fs/promises'
import { exists } from '../utils/fs.js'

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

export async function generateNamespaces(outputDir) {
  const matches = await globby([path.join(outputDir)], { onlyDirectories: true })
  for (const match of matches) {
    const contentsPath = path.join(match, 'Contents.json')
    if (await exists(contentsPath)) {
      continue
    }

    await fs.writeFile(contentsPath, JSON.stringify(createProvidesNamespaceJson()))
  }
}
