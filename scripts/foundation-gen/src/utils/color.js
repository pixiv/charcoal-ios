export function parseRGBA(value) {
  const normalized = value.trim().toLowerCase()
  const rgbMatch = normalized.match(/^rgba?\(([^)]+)\)$/)
  if (!rgbMatch) {
    throw new Error(`Unsupported color format: ${value}`)
  }

  const parts = rgbMatch[1].split(',').map((it) => it.trim())
  if (parts.length !== 3 && parts.length !== 4) {
    throw new Error(`Unsupported color component count: ${value}`)
  }

  const [r, g, b, a = '1'] = parts
  const alpha = Number(a)
  const normalizedAlpha = alpha > 1 ? alpha / 255 : alpha

  return {
    red: Number(r) / 255,
    green: Number(g) / 255,
    blue: Number(b) / 255,
    alpha: normalizedAlpha,
  }
}
