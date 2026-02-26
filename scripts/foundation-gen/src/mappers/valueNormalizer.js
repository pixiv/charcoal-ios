export function normalizePixelValue(value) {
  if (typeof value === 'number') {
    return value
  }

  if (typeof value !== 'string') {
    throw new Error(`Unsupported pixel value type: ${typeof value}`)
  }

  const trimmed = value.trim()
  if (trimmed.endsWith('px')) {
    return Number(trimmed.replace(/px$/, ''))
  }

  return Number(trimmed)
}

export function toFoundationV2JSON(raw) {
  const radius = raw.radius ?? {}
  const spacing = raw.space ?? {}
  const text = raw.text ?? {}

  const normalizedRadius = Object.fromEntries(
    Object.entries(radius).map(([key, token]) => [key, normalizePixelValue(token.value)]),
  )

  const normalizedSpacing = Object.fromEntries(
    Object.entries(spacing).map(([key, token]) => [key, normalizePixelValue(token.value)]),
  )

  const normalizedTypography = Object.fromEntries(
    Object.entries(text).map(([key, token]) => [key, String(token.value)]),
  )

  return {
    radius: normalizedRadius,
    spacing: normalizedSpacing,
    typography: normalizedTypography,
  }
}
