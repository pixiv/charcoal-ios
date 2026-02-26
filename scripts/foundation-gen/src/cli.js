import yargs from 'yargs'
import { hideBin } from 'yargs/helpers'
import { SUPPORTED_VERSIONS } from './models/types.js'
import { generate } from './core/generate.js'

function demandBySchema(args) {
  if (args.schema === 'v1' && !args.input) {
    throw new Error('--input is required for --schema v1')
  }

  if (args.schema === 'v2') {
    const hasLegacyPair = Boolean(args.inputLight && args.inputDark)
    const hasAppliedPair = Boolean(args.inputLightApplied && args.inputDarkApplied)

    if (!hasLegacyPair && !hasAppliedPair) {
      throw new Error(
        'For --schema v2, provide either (--inputLight and --inputDark) or (--inputLightApplied and --inputDarkApplied)',
      )
    }

    if ((args.inputLightPrimitives && !args.inputDarkPrimitives) || (!args.inputLightPrimitives && args.inputDarkPrimitives)) {
      throw new Error('--inputLightPrimitives and --inputDarkPrimitives must be provided together')
    }
  }
}

export function runCli() {
  yargs(hideBin(process.argv))
    .version(false)
    .command(
      'generate',
      'Generate foundation outputs and color assets',
      (builder) =>
        builder
          .option('schema', {
            describe: 'Token schema',
            choices: SUPPORTED_VERSIONS,
            demandOption: true,
            type: 'string',
          })
          .option('input', {
            describe: 'Input file path for v1 theme',
            type: 'string',
          })
          .option('inputLight', {
            describe: 'Input light token file path for v2',
            type: 'string',
          })
          .option('inputDark', {
            describe: 'Input dark token file path for v2',
            type: 'string',
          })
          .option('inputLightApplied', {
            describe: 'Input light applied token file path for v2',
            type: 'string',
          })
          .option('inputDarkApplied', {
            describe: 'Input dark applied token file path for v2',
            type: 'string',
          })
          .option('inputLightPrimitives', {
            describe: 'Input light primitive token file path for v2',
            type: 'string',
          })
          .option('inputDarkPrimitives', {
            describe: 'Input dark primitive token file path for v2',
            type: 'string',
          })
          .option('outputJson', {
            describe: 'Output JSON directory',
            demandOption: true,
            type: 'string',
          })
          .option('outputSwift', {
            describe: 'Output Swift directory',
            demandOption: true,
            type: 'string',
          })
          .option('outputColorAsset', {
            describe: 'Output color asset directory',
            demandOption: true,
            type: 'string',
          }),
      async (args) => {
        demandBySchema(args)

        await generate({
          schema: args.schema,
          input: args.input,
          inputLight: args.inputLight,
          inputDark: args.inputDark,
          inputLightApplied: args.inputLightApplied,
          inputDarkApplied: args.inputDarkApplied,
          inputLightPrimitives: args.inputLightPrimitives,
          inputDarkPrimitives: args.inputDarkPrimitives,
          outputJson: args.outputJson,
          outputSwift: args.outputSwift,
          outputColorAsset: args.outputColorAsset,
        })
      },
    )
    .strict()
    .help()
    .parse()
}
