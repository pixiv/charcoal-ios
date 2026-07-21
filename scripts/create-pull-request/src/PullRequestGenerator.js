import { Octokit as OctokitRest } from '@octokit/rest'
import { retry } from '@octokit/plugin-retry'
import { execFileSync } from 'child_process'

const Octokit = OctokitRest.plugin(retry)

const formatDate = (date) => {
  var y = date.getFullYear()
  var m = ('00' + (date.getMonth() + 1)).slice(-2)
  var d = ('00' + date.getDate()).slice(-2)
  return y + m + d
}

const rootDir = execFileSync('git', ['rev-parse', '--show-toplevel']).toString().trim()
const newBranch = `update_foundation_${formatDate(new Date())}`
const title = "Update Foundation"

const git = (args) => execFileSync('git', ['-C', rootDir, ...args], { stdio: 'inherit' })

export class PullRequestGenerator {
    owner
    repo
    baseBranch

    constructor(owner, repo, baseBranch) {
        this.owner = owner
        this.repo = repo
        this.baseBranch = baseBranch
    }

    static async runFromCli(owner, repo, baseBranch) {
        const client = new this(owner, repo, baseBranch)
        await client.createPullRequest()
        console.log('success!')
    }

    async createPullRequest() {
        const [owner, repo, baseBranch] = [this.owner, this.repo, this.baseBranch]

        console.log(`Generate Pull Request on ${owner}/${repo}/${baseBranch}`)

        const octokit = new Octokit({ auth: process.env.GITHUB_ACCESS_TOKEN })

        // Check if pull request exists
        const allPulls = [];
        var page = 1;
        var hasNext = true;
        while (hasNext) {
            const pulls = await octokit.pulls.list({
                owner,
                repo,
                page: page
            });
            allPulls.push(...pulls.data)
            hasNext = pulls.data.length > 0
            page++
        }

        const existingPR = allPulls.find(p => p.title === title)

        if (existingPR != undefined) {
            return console.log("Pull Request already exists, skip")
        }

        const hasChanges = execFileSync('git', ['-C', rootDir, 'status', '--porcelain', '-uall'])
          .toString()
          .trim()
          .length > 0
        if (!hasChanges) {
          return
        }

        git(['checkout', '-b', newBranch])
        git(['add', '-A'])
        git([
          '-c', 'user.name=github-actions[bot]',
          '-c', 'user.email=41898282+github-actions[bot]@users.noreply.github.com',
          'commit', '-m', 'Update foundation',
        ])
        git(['push', 'origin', newBranch])

        await octokit.pulls.create({
          owner,
          repo,
          head: newBranch,
          base: baseBranch,
          title,
          body: '',
        })
    }
}
