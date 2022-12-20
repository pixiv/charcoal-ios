import yargs from 'yargs'
import { XcassetGenerator } from './XcassetGenerator.js'

yargs
    .scriptName('xcasset-gen')
    .command(
        'generate',
        'Generate Xcode Asset Catalog from images and colors',
        () => [
            yargs.option('input'),
            yargs.option('output')
        ],
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
