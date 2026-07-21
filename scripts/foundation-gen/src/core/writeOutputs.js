import path from 'path'
import { promises as fs } from 'fs'
import { ensureDir } from '../utils/fs.js'

export async function writeFoundationOutputs(foundationData, jsonOutputDir, swiftOutputDir) {
  await ensureDir(swiftOutputDir)
  await ensureDir(jsonOutputDir)

  await fs.writeFile(
    path.join(swiftOutputDir, `${foundationData.fileName}.swift`),
    foundationData.swiftData,
  )
  await fs.writeFile(
    path.join(jsonOutputDir, `${foundationData.fileName}.json`),
    foundationData.jsonData,
  )
}
