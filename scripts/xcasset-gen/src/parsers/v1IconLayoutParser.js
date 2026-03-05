import path from 'path'

export function parseV1IconLayout(inputDir, filePath) {
  const relative = path.relative(inputDir, filePath)
  const segments = relative.split(path.sep)

  if (segments.length !== 2) {
    throw new Error(`Invalid v1 icon path: ${relative}`)
  }

  return {
    relative,
    relativeDir: path.dirname(relative),
    basename: path.basename(relative, '.pdf'),
    filename: path.basename(relative),
    sourcePath: filePath,
  }
}
