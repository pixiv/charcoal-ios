import yargs from 'yargs'
import { hideBin } from 'yargs/helpers'
import { SUPPORTED_VERSIONS } from './models/types.js'
import { generate } from './core/generate.js'

export function runCli() {
  yargs(hideBin(process.argv))
    .version(false)
    .command(
      'generate',
      'Generate Xcode Asset Catalog from PDF files',
      (builder) =>
        builder
          .option('schema', {
            describe: 'Icon schema',
            choices: SUPPORTED_VERSIONS,
            demandOption: true,
            type: 'string',
          })
          .option('input', {
            describe: 'Input icon directory',
            demandOption: true,
            type: 'string',
          })
          .option('output', {
            describe: 'Output xcassets directory',
            demandOption: true,
            type: 'string',
          }),
      async (args) => {
        await generate({
          schema: args.schema,
          input: args.input,
          output: args.output,
        })
      },
    )
    .strict()
    .help()
    .parse()
}
