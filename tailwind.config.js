module.exports = {
  content: [
    "./app/views/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/assets/stylesheets/**/*.css",
    "./app/javascript/**/*.js"
  ],
  theme: {
    extend: {
      colors: {
        customBackground: '#96C9F4',
        customFormBackground: '#FAFFAF',
        customBlue: '#0F67B1',
      },
      margin: {
        'header-space': '1rem', // 必要に応じて調整
      },
    },
  },
  plugins: [
    require('daisyui'),
  ],
  daisyui: {
    themes: [
      "cupcake"
    ],
  },
}