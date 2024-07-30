import {
  createPropertyFormatter,
  fileHeader,
  sortByReference,
  setSwiftFileProperties,
  sortByName,
} from "./node_modules/style-dictionary/lib/common/formatHelpers/index.js";

import iosSwiftAny from "./any.swift.template.js";

function getFormattingCloneWithoutPrefix(formatting) {
  const formattingWithoutPrefix = structuredClone(formatting) ?? {};
  delete formattingWithoutPrefix.prefix;
  return formattingWithoutPrefix;
}

const formats = {
  "ios-swift/charcoal-enum.swift": async function ({
    dictionary,
    options,
    file,
    platform,
  }) {
    const { allTokens, tokens, unfilteredTokens } = dictionary;
    const { outputReferences, formatting, usesDtcg } = options;
    options = setSwiftFileProperties(options, "enum", platform.transformGroup);
    const formatProperty = createPropertyFormatter({
      outputReferences,
      dictionary,
      formatting: {
        suffix: "",
        ...formatting,
      },
      usesDtcg,
    });

    const darkThemeKey = "pixiv/dark";

    const darkThemeDataTokens = allTokens.filter(
      (token) => token.attributes.type == darkThemeKey
    );

    const themeDataTokens = allTokens.filter(
      (token) => token.attributes.type != darkThemeKey
    );

    for (const token of themeDataTokens) {
      const darkThemeToken = darkThemeDataTokens.find(
        (darkToken) => darkToken.attributes.item === token.attributes.type
      );
      if (darkThemeToken) {
        token.value = `UIColor(light:${token.value}, dark:${darkThemeToken.value})`;
      }
    }

    let sortedTokens;
    if (outputReferences) {
      sortedTokens = [...themeDataTokens].sort(
        sortByReference(tokens, { unfilteredTokens })
      );
    } else {
      sortedTokens = [...themeDataTokens].sort(sortByName);
    }
    const header = await fileHeader({
      file,
      commentStyle: "short",
      formatting: getFormattingCloneWithoutPrefix(formatting),
      options,
    });
    return iosSwiftAny({
      allTokens: sortedTokens,
      file,
      options,
      formatProperty,
      header,
    });
  },
};

export default formats;
