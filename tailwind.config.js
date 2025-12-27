/** @type {import('tailwindcss').Config} */
export default {
  content: ["./index.html", "./src/**/*.{vue,js,ts}"],
  theme: {
    extend: {
      colors: {

        // 60-30-10 Color Palette
        "primary-dark": "#1B211A",      // 60% - Main background
        "primary-green": "#8BAE66",     // 30% - Primary actions
        "accent-cream": "#EBD5AB",      // 10% - Accents
        
        "dodgeroll-gold": {
          50: "#fff9eb",
          100: "#fdecc8",
          200: "#fbd88c",
          300: "#f9bd50",
          400: "#f79f1a",
          500: "#f1820f",
          600: "#d65f09",
          700: "#b13f0c",
          800: "#903210",
          900: "#762911",
          950: "#441204",
        },
        "apple-green": "#046E1B",
        "dire-wolf": "#292727",
      },
    },
    fontFamily: {
      Montserrat: "Montserrat, sans-serif",
    },
    container: {
      center: true,
      padding: "2rem",
    },
  },
  plugins: [],
}

