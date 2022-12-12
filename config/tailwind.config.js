const defaultTheme = require('tailwindcss/defaultTheme');

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
  ],
  safelist: [
    'w-24',
    'h-24',
    'w-9',
    'h-9',
    'w-8',
    'h-8',
    'border-none',
    'border-cyan-600',
    'border-orange-600',
    'border-lime-600',
    'border-green-600',
    'border-teal-600',
    'border-sky-600',
    'border-violet-600',
    'border-fuchsia-600',
    'border-pink-600',
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ],
};
