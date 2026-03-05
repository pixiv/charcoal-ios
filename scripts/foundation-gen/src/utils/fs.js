import { promises as fs } from 'fs'

export async function removeDirIfExists(path) {
  try {
    await fs.rm(path, { recursive: true })
  } catch (e) {
    if (e.code !== 'ENOENT') {
      throw e
    }
  }
}

export async function ensureDir(path) {
  await fs.mkdir(path, { recursive: true })
}

export async function writeJSON(path, json) {
  await fs.writeFile(path, JSON.stringify(json))
}
