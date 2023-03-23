const { remPair, rem } = require('@viget/tailwindcss-plugins/utilities/fns')
const plugin = require('tailwindcss/plugin')

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
      black: '#181818',
      primary: {
        DEFAULT: '#994930',
        hover: '#7A3A2B',
        active: '#5B2B26',
      },
      secondary: {
        DEFAULT: '#E2DAC6',
      },
      tertiary: {
        DEFAULT: '#3B2721',
      },
    },
    fontFamily: {
      inherit: 'inherit',
      body: ['ShantellSans', 'Comic Sans', 'sans-serif'],
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
      ...remPair(20),
      ...remPair(24),
      ...remPair(28),
      ...remPair(32),
      ...remPair(36),
      ...remPair(40),
      ...remPair(44),
      ...remPair(48),
      ...remPair(56),
      ...remPair(56),
      ...remPair(64),
      ...remPair(72),
    },
    borderRadius: {
      none: '0',
      full: '9999px',
      DEFAULT: rem(10),
    },
    extend: {
      minHeight: ({ theme }) => ({
        ...theme('spacing'),
      }),
    },
    extend: {
      animation: {
        'font-bounce': 'font-bounce 2000ms alternate ease-in-out infinite',
      },
      keyframes: {
        'font-bounce': {
          from: {
            'font-variation-settings':
              '"ital" 0, "INFM" 0,"BNCE" -50, "SPAC" 0',
          },
          to: {
            'font-variation-settings': '"ital" 0, "INFM" 0,"BNCE" 50, "SPAC" 0',
          },
        },
      },
      backgroundImage: {
        hatching: "url('hatching.webp')",
      },
      backgroundSize: {
        500: '500px',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('./config/tailwind/wrapper.js'),
    require('./config/tailwind/scrollbar.js'),
    plugin(function ({ addUtilities }) {
      addUtilities({
        '.font-var-base': {
          'font-variation-settings': '"ital" 0, "INFM" 0, "BNCE" 100, "SPAC" 0',
        },
        '.font-var-bounce': {
          'font-variation-settings':
            '"ital" 100, "INFM" 0, "BNCE" 100, "SPAC" 0',
        },
        '.font-var-italic': {
          'font-variation-settings':
            '"ital" 100, "INFM" 0, "BNCE" 50, "SPAC" 0',
        },
        '.font-var-informal': {
          'font-variation-settings':
            '"ital" 0, "INFM" 100, "BNCE" 50, "SPAC" 0',
        },
        '.font-var-formal': {
          'font-variation-settings': '"ital" 0, "INFM" 0, "BNCE" 0, "SPAC" 0',
        },
      })
    }),
  ],
}
