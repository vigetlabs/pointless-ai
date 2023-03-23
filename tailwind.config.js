const { remPair, rem } = require('@viget/tailwindcss-plugins/utilities/fns')

module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
  ],
  theme: {
    colors: {
      transparent: 'transparent',
      current: 'currentColor',
      white: '#ffffff',
      primary: {
        DEFAULT: '#994930',
        hover: '#7A3A2B',
        active: '#5B2B26',
      },
      secondary: {
        DEFAULT: '#E2DAC6',
      },
    },
    spacing: {
      0: '0',
      ...remPair(1),
      ...remPair(2),
      ...remPair(3),
      ...remPair(4),
      ...remPair(5),
      ...remPair(6),
      ...remPair(8),
      ...remPair(10),
      ...remPair(12),
      ...remPair(14),
      ...remPair(16),
      ...remPair(18),
      ...remPair(24),
      ...remPair(28),
      ...remPair(32),
      ...remPair(36),
      ...remPair(40),
      ...remPair(44),
      ...remPair(48),
      ...remPair(56),
    },
  },
}
