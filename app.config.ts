export default defineAppConfig({
  ui: {
    primary: 'green',
    gray: 'cool',
    button: {
      default: {
        color: 'primary'
      }
    },
    card: {
      base: 'overflow-hidden',
      rounded: 'rounded-lg',
      shadow: 'shadow-lg hover:shadow-xl transition-shadow duration-300',
      background: 'bg-white',
      ring: 'ring-1 ring-[#8BAE66]/20'
    },
    input: {
      default: {
        size: 'lg'
      }
    }
  },
  nuxtIcon: {},
  colorMode: {
    preference: 'light',
    fallback: 'light',
    componentName: 'ColorScheme'
  }
})