import { parseV1Theme } from '../parsers/v1ThemeParser.js'
import { parseV2Tokens } from '../parsers/v2TokenParser.js'
import { generateFoundationData } from './generateFoundation.js'
import { writeFoundationOutputs } from './writeOutputs.js'
import { generateColorAssets } from './generateColorAssets.js'

export async function generate({
  schema,
  input,
  inputLight,
  inputDark,
  inputLightApplied,
  inputDarkApplied,
  inputLightPrimitives,
  inputDarkPrimitives,
  outputJson,
  outputSwift,
  outputColorAsset,
}) {
  const parsed =
    schema === 'v1'
      ? await parseV1Theme(input)
      : await parseV2Tokens({
          inputLight,
          inputDark,
          inputLightApplied,
          inputDarkApplied,
          inputLightPrimitives,
          inputDarkPrimitives,
        })

  const foundationData = await generateFoundationData(parsed)
  await writeFoundationOutputs(foundationData, outputJson, outputSwift)
  await generateColorAssets(parsed, outputColorAsset)
}
