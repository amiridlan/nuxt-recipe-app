export default defineNuxtPlugin(() => {
  const colorMode = useColorMode()
  
  // Force light mode on mount
  colorMode.preference = 'light'
  
  // Remove dark class if it exists
  if (process.client) {
    const html = document.documentElement
    html.classList.remove('dark')
    html.style.colorScheme = 'light'
  }
})