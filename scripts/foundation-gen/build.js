import Color from "tinycolor2";
import { dirname } from "path";
import { fileURLToPath } from "url";
import StyleDictionary from "style-dictionary";
import formats from "./formats.js";
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
    return token.attributes.category != "Border radius";
  },
  transform: function (token, options) {
    return camelCase(
      [options.prefix].concat(token.path.slice(1, token.path.length)).join(" "),
      camelOpts
    );
  },
});

StyleDictionary.registerTransform({
  name: "swift/color",
  type: "value",
  filter: function (token) {
    return (
      token.attributes.category === "Color" ||
      token.attributes.category === "Colors" ||
      token.attributes.category === "Brand color"
    );
  },
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
      token.attributes.category === "Text" &&
      token.attributes.type.includes("font-family")
    );
  },
  transform: function (token, _, options) {
    return `"${token.value}"`;
  },
});

StyleDictionary.registerFilter({
  name: "charcoal-color-filter",
  filter: function (token) {
    return (
      token.attributes.category === "Color" ||
      token.attributes.category === "Colors" ||
      token.attributes.category === "Brand color"
    );
  },
});

StyleDictionary.registerFilter({
  name: "charcoal-border-radius-filter",
  filter: function (token) {
    return token.attributes.category === "Border radius";
  },
});

StyleDictionary.registerFilter({
  name: "charcoal-spacings-filter",
  filter: function (token) {
    return (
      token.attributes.category === "Spacings" ||
      token.attributes.category === "Space"
    );
  },
});

StyleDictionary.registerFilter({
  name: "charcoal-text-filter",
  filter: function (token) {
    return token.attributes.category === "Text";
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

const sd = new StyleDictionary(__dirname + "/config.json");

// FINALLY, BUILD ALL THE PLATFORMS
await sd.buildAllPlatforms();
