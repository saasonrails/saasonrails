const colors = require('tailwindcss/colors')

const PRIMARY_COLOR = 'purple'
const SECONDARY_COLOR = 'teal'
const NEUTRAL_COLOR = 'slate'

module.exports = {
  content: [
    './app/**/*.{erb,haml,html,slim}',
    './lib/**/*.{erb,haml,html,slim}',
    './app/javascript/**/*.js',
  ],
  theme: {
    extend: {
      colors: {
        primary: colors[PRIMARY_COLOR],
        secondary: colors[SECONDARY_COLOR],
        neutral: colors[NEUTRAL_COLOR],
      }
    },
  },
  plugins: [],
  safelist: []
}