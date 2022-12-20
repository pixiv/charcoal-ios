import yargs from 'yargs'
import { hideBin } from 'yargs/helpers'
import { FoundationGenerator } from './FoundationGenerator.js'

yargs(hideBin(process.argv))
  .command(
    'generate',
    '',
    (yargs) => {
      return yargs
        .positional('input', {
          describe: 'input',
          type: 'string',
        })
        .positional('outputJson', {
          describe: 'output json directory',
          type: 'string',
        })
        .positional('outputSwift', {
          describe: 'output json directory',
          type: 'string',
        })
        .positional('outputColorAsset', {
          describe: 'output json directory',
          type: 'string',
        })
    },
    ({ input, outputJson, outputSwift, outputColorAsset }) => {
      void FoundationGenerator.runFromCli(input, outputJson, outputSwift, outputColorAsset).catch((e) => {
        console.error(e)
        process.exit(1)
      })
    }
  )
  .help()
  .parse()
