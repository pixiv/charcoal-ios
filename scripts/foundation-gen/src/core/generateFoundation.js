import { quicktype, InputData, jsonInputForTargetLanguage } from 'quicktype-core'
import { toFoundationV2JSON } from '../mappers/valueNormalizer.js'
import { V1_FOUNDATION_FILE_NAME, V2_FOUNDATION_FILE_NAME } from '../models/types.js'

const targetLanguage = 'swift'

function createV2SwiftData() {
  return `import Foundation

public struct CharcoalFoundationV2: Codable {
    public let radius: [String: Double]
    public let spacing: [String: Double]
    public let typography: [String: String]

    public init(radius: [String: Double], spacing: [String: Double], typography: [String: String]) {
        self.radius = radius
        self.spacing = spacing
        self.typography = typography
    }
}
`
}

async function generateV1FoundationData(data) {
  const jsonInput = jsonInputForTargetLanguage(targetLanguage)
  const outputJSON = JSON.stringify(data.foundation)

  await jsonInput.addSource({
    name: V1_FOUNDATION_FILE_NAME,
    samples: [outputJSON],
  })

  const inputData = new InputData()
  inputData.addInput(jsonInput)

  const { lines } = await quicktype({
    inputData,
    lang: targetLanguage,
    inferMaps: false,
    rendererOptions: {
      'type-prefix': 'Charcoal',
      'access-level': 'public',
    },
  })

  return {
    fileName: V1_FOUNDATION_FILE_NAME,
    jsonData: outputJSON,
    swiftData: lines.join('\n'),
  }
}

function generateV2FoundationData(data) {
  const outputJSON = JSON.stringify(toFoundationV2JSON(data.light))

  return {
    fileName: V2_FOUNDATION_FILE_NAME,
    jsonData: outputJSON,
    swiftData: createV2SwiftData(),
  }
}

export async function generateFoundationData(data) {
  if (data.version === 'v1') {
    return generateV1FoundationData(data)
  }

  return generateV2FoundationData(data)
}
