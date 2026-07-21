export function toColorAssetRelativePath(tokenKey) {
  return tokenKey.split('/').map((segment) => {
    const negativeNumberMatch = /^-(\d+)$/.exec(segment)
    if (negativeNumberMatch) {
      return `minus${negativeNumberMatch[1]}`
    }
    return segment
  })
}
