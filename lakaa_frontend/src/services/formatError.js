export default function formatError(message) {
  let message = []
  for (let key in error) {
      message.push(`${key}: ${error[key]}`)
  }
  return  message.join(', ')
}
