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
        },
        'slide-right': {
          '0%': { transform: 'translateX(0%)' },
          '100%': { transform: 'translateX(95%)' }
        },
        'slide-left': {
          '0%': { transform: 'translateX(95%)' },
          '100%': { transform: 'translateX(0%)' }
        }
      },
      animation: {
        'slide-up-once': 'slide-up 5s ease-in-out',
        'slide-right': 'slide-right 1s ease-in-out forwards',
        'slide-left': 'slide-left 1s ease-in-out forwards',
      },
      boxShadow: {
        'glitch-top-right': `5px -5px 0 5px ${colors.emerald['400']},   -5px 5px 0 5px${colors.purple['300']}`,
        'glitch-bottom-right': `5px 5px 0 5px ${colors.emerald['400']}, -5px -5px 0 5px ${colors.purple['300']}`,
        'glitch-bottom-left': `-5px 5px 0 5px ${colors.emerald['400']}, 5px -5px 0 5px ${colors.purple['300']}`,
        'glitch-top-left': `-5px -5px 0 5px ${colors.emerald['400']},   5px 5px 0 5px ${colors.purple['300']}`,
        'image-frame': `0 0 0 10px ${colors.black} inset, 0 0 0 15px ${colors.gray['800']} inset`,
      },
      height: theme => ({
        "screen/2": "50vh",
        "screen/3": "calc(100vh / 3)",
        "screen/4": "calc(100vh / 4)",
        "screen/5": "calc(100vh / 5)",
        "screen/6": "calc(100vh / 6)"
      }),
      backgroundImage: theme => ({
        'spotify-album-cover': "linear-gradient(to top, var(--tw-gradient-stops)), var(--spotify-album-cover-url);",
        'background-cover': "var(--background-cover-url);",
      }),
      zIndex: {
        '-999': '-999'
      }
    },
  },
  variants: {
    extend: {
      animation: ['hover']
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
  ],
}
