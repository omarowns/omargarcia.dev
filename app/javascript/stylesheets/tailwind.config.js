const colors = require('tailwindcss/colors')

module.exports = {
  purge: [],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      keyframes: {
        'slide-up': {
          '0%': { transform: 'translateY(100%)' },
          '100%': { transform: 'translateY(0%)' }
        }
      },
      animation: {
        'slide-up-once': 'slide-up 5s ease-in-out'
      },
      boxShadow: {
        'glitch-top-right': `5px -5px 0 5px ${colors.emerald['400']},   -5px 5px 0 5px${colors.purple['300']}`,
        'glitch-bottom-right': `5px 5px 0 5px ${colors.emerald['400']}, -5px -5px 0 5px ${colors.purple['300']}`,
        'glitch-bottom-left': `-5px 5px 0 5px ${colors.emerald['400']}, 5px -5px 0 5px ${colors.purple['300']}`,
        'glitch-top-left': `-5px -5px 0 5px ${colors.emerald['400']},   5px 5px 0 5px ${colors.purple['300']}`,
      },
      height: theme => ({
        "screen/2": "50vh",
        "screen/3": "calc(100vh / 3)",
        "screen/4": "calc(100vh / 4)",
        "screen/5": "calc(100vh / 5)",
        "screen/6": "calc(100vh / 6)"
      })
    },
  },
  variants: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/forms'),
  ],
}
