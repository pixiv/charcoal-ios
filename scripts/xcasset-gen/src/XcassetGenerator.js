import path from 'path'
import fs from 'fs/promises'
import { globby } from 'globby'

export class XcassetGenerator {
    inputDir
    outputDir

    static async runFromCli(input, output) {
        const client = new this(input, output)
        await client.createImageAssets()
        console.log('success!')
    }

    constructor(input, output) {
        this.inputDir = input
        this.outputDir = output
    }

    async createImageAssets() {
        await fs.rmdir(this.outputDir, { recursive: true })
        const matches = await globby([path.join(this.inputDir, '**/*.pdf')])
        for (const match of matches) {
            const relative = path.relative(this.inputDir, match)
            const relativeDir = path.dirname(relative)
            const basename = path.basename(relative, '.pdf')
            const filename = basename + '.pdf'
            const outputDir = path.join(this.outputDir, relativeDir, basename + '.imageset')
            const outputPath = path.join(outputDir, filename)

            await fs.mkdir(outputDir, { recursive: true })
            await fs.copyFile(match, outputPath)
            await fs.writeFile(path.join(outputDir, 'Contents.json'), JSON.stringify(createUniversalImageJson(filename)))
        }

        await this.createNamespaces()
    }
    
    async createNamespaces() {
        const matches = await globby([path.join(this.outputDir)], { onlyDirectories: true })
        for (const match of matches) {
            try {
                await fs.writeFile(path.join(match, 'Contents.json'), JSON.stringify(createProvidesNamespaceJson()), { flag: 'wx' })
            } catch (e) {
                // ignore overwrite error
                if (e.code !== 'EEXIST') {
                    throw e
                }   
            }
        }
    }
}

function createUniversalImageJson(filename) {
    return {
        'images': [
            {
                'idiom': 'universal',
                'filename': filename
            }
        ],
        ...createXCAssetInfoJSON()
    }
}

function createProvidesNamespaceJson() {
    return {
        ...createXCAssetInfoJSON(),
        'properties': {
            'provides-namespace': true
        }
    }
}

function createXCAssetInfoJSON() {
    return {
        'info': {
            'version': 1,
            'author': 'pixiv'
        }
    }
}
