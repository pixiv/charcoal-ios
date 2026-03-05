# foundation-gen

Design Token 1.0 の `theme.json` を取得する場合:

```sh
$ curl -fL https://unpkg.com/@charcoal-ui/theme@latest/theme.json -o theme.json
```

Design Token 2.0 (applied/primitives) を Figma Variables から取得する場合:

```sh
$ corepack enable
$ export FIGMA_TOKEN=YOUR_FIGMA_TOKEN
$ export FIGMA_NODE_ID_APPLIEDS=YOUR_FIGMA_NODE_ID_APPLIEDS
$ export FIGMA_NODE_ID_PRIMITIVES=YOUR_FIGMA_NODE_ID_PRIMITIVES
$
$ FIGMA_FILE_ID="$FIGMA_NODE_ID_APPLIEDS" pnpm dlx @charcoal-ui/token-cli@5.6.0-beta.4 fetch --output applied-raw.json
$ FIGMA_FILE_ID="$FIGMA_NODE_ID_PRIMITIVES" pnpm dlx @charcoal-ui/token-cli@5.6.0-beta.4 fetch --output primitives-raw.json
$
$ pnpm dlx @charcoal-ui/token-cli@5.6.0-beta.4 transform --source applied-raw.json --output applied-light.json --mode-name "pixiv/light" || \
  pnpm dlx @charcoal-ui/token-cli@5.6.0-beta.4 transform --source applied-raw.json --output applied-light.json --mode-name "light"
$ pnpm dlx @charcoal-ui/token-cli@5.6.0-beta.4 transform --source applied-raw.json --output applied-dark.json --mode-name "pixiv/dark" || \
  pnpm dlx @charcoal-ui/token-cli@5.6.0-beta.4 transform --source applied-raw.json --output applied-dark.json --mode-name "dark"
$ pnpm dlx @charcoal-ui/token-cli@5.6.0-beta.4 transform --source primitives-raw.json --output primitives-light.json --mode-name "pixiv/light" || \
  pnpm dlx @charcoal-ui/token-cli@5.6.0-beta.4 transform --source primitives-raw.json --output primitives-light.json --mode-name "light"
$ pnpm dlx @charcoal-ui/token-cli@5.6.0-beta.4 transform --source primitives-raw.json --output primitives-dark.json --mode-name "pixiv/dark" || \
  pnpm dlx @charcoal-ui/token-cli@5.6.0-beta.4 transform --source primitives-raw.json --output primitives-dark.json --mode-name "dark"
```

```sh
$ npm install
$ npm run foundation-gen -- generate \
  --schema v1 \
  --input ./theme.json \
  --outputJson ../../Sources/CharcoalShared/Generated \
  --outputSwift ../../Sources/CharcoalShared/Generated \
  --outputColorAsset ../../Sources/CharcoalShared/ColorPalette.generated.xcassets
```

```sh
$ npm run foundation-gen -- generate \
  --schema v2 \
  --inputLightApplied ./applied-light.json \
  --inputDarkApplied ./applied-dark.json \
  --inputLightPrimitives ./primitives-light.json \
  --inputDarkPrimitives ./primitives-dark.json \
  --outputJson ../../Sources/CharcoalShared/Generated \
  --outputSwift ../../Sources/CharcoalShared/Generated \
  --outputColorAsset ../../Sources/CharcoalShared/ColorPaletteV2.generated.xcassets
```
