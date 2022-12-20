import path from 'path'
import { promises as fs } from 'fs'
import { quicktype, InputData, jsonInputForTargetLanguage } from 'quicktype-core'

const targetLanguage = 'swift'
const foundationFileName = 'CharcoalFoundation'

export class FoundationGenerator {
  inputSource
  jsonOutputDir
  swiftOutputDir
  colorAssetOutputDir

  static async runFromCli(inputSource, jsonOutputDir, swiftOutputDir, colorAssetOutputDir) {
    const client = new this(inputSource, jsonOutputDir, swiftOutputDir, colorAssetOutputDir)
    await client.createFoundation()
    console.log('success!')
  }

  constructor(input, jsonOutputDir, swiftOutputDir, colorAssetOutputDir) {
    this.inputSource = input
    this.jsonOutputDir = jsonOutputDir
    this.swiftOutputDir = swiftOutputDir
    this.colorAssetOutputDir = colorAssetOutputDir
  }

  async createFoundation() {
    const source = await fs.readFile(this.inputSource, 'utf8')
    const data = JSON.parse(source)
    const { light, dark } = data
    await this.createSwiftFoundation(light)
    await this.createColorAsset(light, dark)
  }

  async createSwiftFoundation(theme) {
    try {
      await fs.rm(this.swiftOutputDir, { recursive: true })
      await fs.rm(this.jsonOutputDir, { recursive: true })
    } catch (e) {
      if (e.code !== 'ENOENT') {
        throw e
      }
    }

    const jsonInput = jsonInputForTargetLanguage(targetLanguage)

    const { borderRadius, spacing, typography } = theme
    const outputData = JSON.stringify({ borderRadius, spacing, typography })

    await jsonInput.addSource({
      name: foundationFileName,
      samples: [outputData],
    })

    const inputData = new InputData()
    inputData.addInput(jsonInput)

    let { lines: swiftData } = await quicktype({
      inputData,
      lang: targetLanguage,
      inferMaps: false,
      rendererOptions: {
        'type-prefix': 'Charcoal',
        'access-level': 'public',
      },
    })

    await fs.mkdir(this.swiftOutputDir, { recursive: true })
    await fs.writeFile(path.join(this.swiftOutputDir, `${foundationFileName}.swift`), swiftData.join('\n'))
    await fs.mkdir(this.jsonOutputDir, { recursive: true })
    await fs.writeFile(path.join(this.jsonOutputDir, `${foundationFileName}.json`), outputData)
  }

  async createColorAsset(light, dark) {
    try {
      const stat = await fs.stat(this.colorAssetOutputDir)
      await fs.rm(this.colorAssetOutputDir, { recursive: true })
    } catch (e) {
      if (e.code !== 'ENOENT') {
        throw e
      }
    }

    const { color: colorsLight, gradientColor: gradientColorsLight } = light
    const { color: colorsDark, gradientColor: gradientColorsDark } = dark

    for (const name of Object.keys(colorsLight)) {
      const colorLight = colorsLight[name]
      const colorDark = colorsDark[name]

      const outputDir = path.join(this.colorAssetOutputDir, `${name}.colorset`)
      await fs.mkdir(outputDir, { recursive: true })
      await fs.writeFile(path.join(outputDir, 'Contents.json'), JSON.stringify(createColorJson(colorLight, colorDark)))
    }

    for (const name of Object.keys(gradientColorsLight)) {
      for (const [index, _] of gradientColorsLight[name].entries()) {
        const gradientLight = gradientColorsLight[name][index]
        const gradientDark = gradientColorsDark[name][index]

        const outputDir = path.join(this.colorAssetOutputDir, `${name}_${gradientLight.ratio}.colorset`)
        await fs.mkdir(outputDir, { recursive: true })
        await fs.writeFile(path.join(outputDir, 'Contents.json'), JSON.stringify(createColorJson(gradientLight.color, gradientDark.color)))
      }
    }

    await fs.mkdir(this.colorAssetOutputDir, { recursive: true })
    await fs.writeFile(path.join(this.colorAssetOutputDir, 'Contents.json'), JSON.stringify(createXCAssetInfoJSON()))
  }
}

function createColorJson(light, dark) {
  return {
    colors: [
      {
        color: {
          'color-space': 'srgb',
          components: {
            alpha: light['alpha'],
            blue: light['blue'],
            green: light['green'],
            red: light['red'],
          },
        },
        idiom: 'universal',
      },
      {
        appearances: [
          {
            appearance: 'luminosity',
            value: 'dark',
          },
        ],
        color: {
          'color-space': 'srgb',
          components: {
            alpha: dark['alpha'],
            blue: dark['blue'],
            green: dark['green'],
            red: dark['red'],
          },
        },
        idiom: 'universal',
      },
    ],
    ...createXCAssetInfoJSON(),
  }
}

function createXCAssetInfoJSON() {
  return {
    info: {
      version: 1,
      author: 'pixiv',
    },
  }
}
