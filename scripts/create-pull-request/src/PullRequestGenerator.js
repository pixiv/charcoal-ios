import { Octokit } from '@octokit/rest'
import { execSync } from 'child_process'
import fs from 'fs'
import path from 'path'

const formatDate = (date) => {
  var y = date.getFullYear()
  var m = ('00' + (date.getMonth() + 1)).slice(-2)
  var d = ('00' + date.getDate()).slice(-2)
  return y + m + d
}

const rootDir = execSync('git rev-parse --show-toplevel').toString().trim()
const newBranch = `update_foundation_${formatDate(new Date())}`
const title = "Update Foundation"

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

        const modified = []
        const created = []
        const deleted = []
      
        const statuses = execSync('git status --porcelain -uall')
          .toString()
          .split('\n')
          .filter(s => s)
        if (statuses.length === 0) {
          return
        }
      
        statuses.forEach((s) => {
          const path = s.slice(3)
          switch (s.slice(0, 2)) {
            case ' M':
              modified.push(path)
              break
            case '??':
              created.push(path)
              break
            case ' D':
              deleted.push(path)
              break
          }
        })
      
        const baseBranchRef = await octokit.git.getRef({
          owner,
          repo,
          ref: `heads/${baseBranch}`,
        })
      
        const newBranchRef = await octokit.git.createRef({
          owner,
          repo,
          ref: `refs/heads/${newBranch}`,
          sha: baseBranchRef.data.object.sha,
        })
      
        const currentCommit = await octokit.git.getCommit({
          owner,
          repo,
          commit_sha: newBranchRef.data.object.sha,
        })
      
        const blobs = []
        for (const file of modified.concat(created)) {
          const blob = await octokit.rest.git.createBlob({
            owner,
            repo,
            content: fs.readFileSync(path.join(rootDir, file), { encoding: 'base64' }),
            encoding: 'base64',
          })
          blobs.push({
            path: file,
            sha: blob.data.sha,
          })
        }
      
        deleted.forEach((file) => {
          blobs.push({
            path: file,
            sha: null,
          })
        })
      
        const newTree = await octokit.git.createTree({
          owner,
          repo,
          base_tree: currentCommit.data.tree.sha,
          tree: blobs.map((blob) => {
            return {
              type: 'blob',
              path: blob.path,
              mode: '100644',
              sha: blob.sha,
            }
          }),
        })
      
        const newCommit = await octokit.git.createCommit({
          owner,
          repo,
          message: 'Update foundation',
          tree: newTree.data.sha,
          parents: [currentCommit.data.sha],
        })
      
        await octokit.git.updateRef({
          owner,
          repo,
          ref: `heads/${newBranch}`,
          sha: newCommit.data.sha,
        })
      
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
