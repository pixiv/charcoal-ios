import path from 'path'

export function toImageSetOutput(entry, outputDir) {
  const outputAssetDir = path.join(outputDir, entry.relativeDir, `${entry.basename}.imageset`)
  const outputPDFPath = path.join(outputAssetDir, entry.filename)

  return {
    outputAssetDir,
    outputPDFPath,
  }
}
