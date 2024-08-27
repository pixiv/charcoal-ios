import {
  createPropertyFormatter,
  fileHeader,
  sortByReference,
  setSwiftFileProperties,
  sortByName,
} from "style-dictionary/utils";

import iosSwiftEnum from "../template/enum.swift.template.js";

function getFormattingCloneWithoutPrefix(formatting) {
  const formattingWithoutPrefix = structuredClone(formatting) ?? {};
  delete formattingWithoutPrefix.prefix;
  return formattingWithoutPrefix;
}

const formats = {
  "ios-swift/charcoal-enum-color.swift": async function ({
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

    const darkThemeKey = "pixiv-dark";

    const darkThemeDataTokens = allTokens.filter((token) =>
      token.filePath.includes(darkThemeKey)
    );

    const themeDataTokens = allTokens.filter(
      (token) => !token.filePath.includes(darkThemeKey)
    );

    for (const token of themeDataTokens) {
      const number = Number(token.attributes.type.split("/").pop());

      if (number < 0) {
        token.name = `${token.name}Negative`;
      }
    }

    function getSecondHalf(str, delimiter) {
      const parts = str.split(delimiter);
      // 如果字符串中没有分隔符，返回整个字符串
      if (parts.length === 1) return str;
      // 取出后半部分
      return parts.slice(1).join(delimiter);
    }

    function lowerCaseFirstLetter(string) {
      if (!string) return string; // 如果字符串为空或null，返回原值
      return string.charAt(0).toLowerCase() + string.slice(1);
    }

    let dynamicPrimitiveColors = [];
    // Map apply token
    for (const token of themeDataTokens) {
      const darkThemeToken = darkThemeDataTokens.find((darkToken) => {
        return darkToken.attributes.item === token.attributes.type;
      });
      if (darkThemeToken) {
        token.value = `UIColor(light:${token.value}, dark:${darkThemeToken.value})`;
      }

      if (token.name.includes("light")) {
        let tokenName = getSecondHalf(token.attributes.type, "/");
        console.log();
        let darkToken = themeDataTokens.find((darkToken) => {
          return darkToken.attributes.type.includes(`dark/${tokenName}`);
        });
        console.log(getSecondHalf(token.attributes.type, "/"), darkToken.name);

        let newToken = Object.assign({}, token);
        newToken.name = lowerCaseFirstLetter(
          newToken.name.replace("light", "")
        );
        newToken.value = `UIColor(light:${newToken.value}, dark:${darkToken.value})`;
        dynamicPrimitiveColors.push(newToken);
      }
    }

    let sortedTokens;
    if (outputReferences) {
      sortedTokens = [...themeDataTokens, ...dynamicPrimitiveColors].sort(
        sortByReference(tokens, { unfilteredTokens })
      );
    } else {
      sortedTokens = [...themeDataTokens, ...dynamicPrimitiveColors].sort(
        sortByName
      );
    }
    const header = await fileHeader({
      file,
      commentStyle: "short",
      formatting: getFormattingCloneWithoutPrefix(formatting),
      options,
    });
    return iosSwiftEnum({
      allTokens: sortedTokens,
      file,
      options,
      formatProperty,
      header,
    });
  },

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

    let sortedTokens;
    if (outputReferences) {
      sortedTokens = [...allTokens].sort(
        sortByReference(tokens, { unfilteredTokens })
      );
    } else {
      sortedTokens = [...allTokens].sort(sortByName);
    }

    const header = await fileHeader({
      file,
      commentStyle: "short",
      formatting: getFormattingCloneWithoutPrefix(formatting),
      options,
    });
    return iosSwiftEnum({
      allTokens: sortedTokens,
      file,
      options,
      formatProperty,
      header,
    });
  },
};

export default formats;
