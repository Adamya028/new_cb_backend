export const getSlug = (text) => {
  return text
    .toString()
    .normalize('NFKD')
    .toLowerCase()
    .trim()
    .replace(/\s+/g, '-')
    .replace(/[^\w\-]+/g, '')
    .replace(/\-\-+/g, '-')
}

export const getHandle = (text) => {
  return text.toString().normalize('NFKD').toLowerCase().trim().replace(/\s+/g, '_')
}

export const getStripeCustomerId = () => {
  return Math.floor(Math.random() * 999999 + 99999).toString()
}
