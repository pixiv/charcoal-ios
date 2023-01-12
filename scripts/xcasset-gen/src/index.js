import yargs from 'yargs'
import { hideBin } from 'yargs/helpers'
import { XcassetGenerator } from './XcassetGenerator.js'

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
                .positional('output', {
                    describe: 'output xml directory',
                    type: 'string',
                })
        },
        ({ input, output }) => {
            void XcassetGenerator.runFromCli(input, output ).catch(
                e => {
                    console.error(e)
                    process.exit(1)
                }
            )
        }
    )
    .help()
    .parse()
