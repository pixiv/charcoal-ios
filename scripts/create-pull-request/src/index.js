import yargs from 'yargs'
import { hideBin } from 'yargs/helpers'
import { PullRequestGenerator } from './PullRequestGenerator.js'

yargs(hideBin(process.argv))
  .command(
    '$0',
    'generate foundation pull request',
    (yargs) => {
      return yargs
        .positional('owner', {
          describe: 'Owner of the repo',
          type: 'string',
        })
        .positional('repo', {
          describe: 'Name of the repo',
          type: 'string',
        })
        .positional('baseBranch', {
          describe: 'BaseBranch of the Pull Request',
          type: 'string',
        })
    },
    ({ owner, repo, baseBranch }) => {
      void PullRequestGenerator.runFromCli(owner, repo, baseBranch).catch((e) => {
        console.error(e)
        process.exit(1)
      })
    }
  )
  .help()
  .parse()
