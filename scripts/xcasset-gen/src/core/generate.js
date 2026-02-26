import { generateImageAssets } from './generateImageAssets.js'
import { generateNamespaces } from './generateNamespaces.js'

export async function generate({ schema, input, output }) {
  await generateImageAssets(schema, input, output)
  await generateNamespaces(output)
}
