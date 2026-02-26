import fs from 'fs/promises'

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

export async function exists(path) {
  try {
    await fs.access(path)
    return true
  } catch {
    return false
  }
}
