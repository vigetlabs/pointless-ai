const plugin = require('tailwindcss/plugin')

module.exports = plugin(({ addComponents }) => {
  const wrapper = {
    '.wrapper': {
      '@apply w-full max-w-5xl px-56 mx-auto': {},
    },
  }
  addComponents(wrapper)
})
