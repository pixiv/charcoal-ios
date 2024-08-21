import Color from "tinycolor2";
import { dirname } from "path";
import { fileURLToPath } from "url";
import StyleDictionary from "style-dictionary";
import formats from "./formater/formats.js";
import { camelCase } from "change-case";

const __dirname = dirname(fileURLToPath(import.meta.url));

var log = false;

const camelOpts = {
  mergeAmbiguousCharacters: true,
};

StyleDictionary.registerTransform({
  name: "name/ti/camel",
  type: "name",
  filter: function (token) {
    return token.attributes.category != "space";
  },
  transform: function (token, options) {
    return camelCase(
      [options.prefix].concat(token.path.slice(1, token.path.length)).join(" "),
      camelOpts
    );
  },
});

const colorFilter = function (token) {
  return (
    token.attributes.category === "color" ||
    token.attributes.category === "brand-color"
  );
};

StyleDictionary.registerTransform({
  name: "swift/color",
  type: "value",
  filter: colorFilter,
  transform: function (token, _, options) {
    const { r, g, b, a } = Color(
      options.usesDtcg ? token.$value : token.value
    ).toRgb();

    const rFixed = (r / 255.0).toFixed(3);
    const gFixed = (g / 255.0).toFixed(3);
    const bFixed = (b / 255.0).toFixed(3);
    return `UIColor(red: ${rFixed}, green: ${gFixed}, blue: ${bFixed}, alpha: ${a})`;
  },
});

StyleDictionary.registerTransform({
  name: "swift/font",
  type: "value",
  filter: function (token) {
    return (
      token.attributes.category === "text" &&
      token.attributes.type.includes("font-family")
    );
  },
  transform: function (token, _, options) {
    return `"${token.value}"`;
  },
});

StyleDictionary.registerFilter({
  name: "charcoal-color-filter",
  filter: colorFilter,
});

StyleDictionary.registerFilter({
  name: "charcoal-border-radius-filter",
  filter: function (token) {
    return token.attributes.category === "radius";
  },
});

StyleDictionary.registerFilter({
  name: "charcoal-spacings-filter",
  filter: function (token) {
    return token.attributes.category === "space";
  },
});

StyleDictionary.registerFilter({
  name: "charcoal-text-filter",
  filter: function (token) {
    return token.attributes.category === "text";
  },
});

StyleDictionary.registerFormat({
  name: "charcoalColorEnumFormat",
  format: formats["ios-swift/charcoal-enum-color.swift"],
});

StyleDictionary.registerFormat({
  name: "charcoalSturctFormat",
  format: formats["ios-swift/charcoal-enum.swift"],
});

StyleDictionary.registerParser({
  name: "json-parser",
  pattern: /\.json$/,
  parser: ({ filePath, contents }) => {
    // hotfix for pixiv-dark to prevent from token collision
    if (filePath.includes("pixiv-dark")) {
      var json = JSON.parse(contents);
      json.color = { "pixiv-dark": json.color };
      console.log(json);
      return json;
    }
    return JSON.parse(contents);
  },
});

const sd = new StyleDictionary(__dirname + "/config.json");

// FINALLY, BUILD ALL THE PLATFORMS
await sd.buildAllPlatforms();
