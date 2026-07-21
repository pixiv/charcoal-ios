import { promises as fs } from 'fs'

export async function parseV1Theme(inputPath) {
  const source = await fs.readFile(inputPath, 'utf8')
  const data = JSON.parse(source)
  const { light, dark } = data

  return {
    version: 'v1',
    foundation: {
      borderRadius: light.borderRadius,
      spacing: light.spacing,
      typography: light.typography,
    },
    light,
    dark,
  }
}
