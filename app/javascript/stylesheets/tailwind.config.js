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
      height: {
        'w-screen': { height: '100vw'}
      },
      width: {
        'h-screen': { width: '100vh'}
      }
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
