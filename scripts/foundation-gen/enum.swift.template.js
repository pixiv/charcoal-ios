/**
 * @typedef {import('../../../../types/DesignToken.ts').TransformedToken} TransformedToken
 * @typedef {import('../../../../types/Config.ts').Config} Config
 * @typedef {import('../../../../types/File.ts').File} File
 * @typedef {import('../../../../types/Config.ts').LocalOptions} LocalOptions
 */

/**
 * @param {{
 *   allTokens: TransformedToken[]
 *   file: File
 *   formatProperty: (token: TransformedToken) => string
 *   options: Config & LocalOptions
 *   header: string
 * }} opts
 */

export default ({ allTokens, file, formatProperty, options, header }) => `
//
// ${file.destination}
//
${header}
${options.import
  .map(/** @param {string} item */ (item) => `import ${item}`)
  .join("\n")}

${options.accessControl ? `${options.accessControl} ` : ""}${
  options.objectType ? `${options.objectType} ` : ""
}${options.className ? `${options.className} ` : ""}{
    ${allTokens.map((token) => `case ${token.name}`).join("\n    ")}

    ${options.accessControl ? `${options.accessControl} ` : ""}var ${
  options.enumPropertyName ? `${options.enumPropertyName} ` : "value"
}: ${options.enumPropertyType ? `${options.enumPropertyType} ` : "Any"} {
        switch self {
            ${allTokens
              .map((token) => `case .${token.name}: return ${token.value};`)
              .join("\n            ")}
        }
    }
}  
`;
