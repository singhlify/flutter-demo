import type { Config } from "tailwindcss";

const config: Config = {
  content: [
    "./app/**/*.{js,ts,jsx,tsx,mdx}",
    "./components/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    extend: {
      colors: {
        "word-blue": "#2B579A",
        "word-blue-hover": "#3A6BB5",
        "word-title": "#2B579A",
        "word-ribbon-bg": "#F3F3F3",
        "word-ribbon-border": "#D1D1D1",
        "word-tab-active": "#FFFFFF",
        "word-tab-hover": "#E1E1E1",
        "word-canvas-bg": "#E8E8E8",
        "word-status-bg": "#2B579A",
        "word-status-text": "#FFFFFF",
        "word-group-label": "#666666",
        "word-icon": "#333333",
        "word-icon-hover": "#E8E8E8",
        "word-divider": "#C8C8C8",
        "word-dropdown-border": "#BBBBBB",
        "word-page": "#FFFFFF",
        "word-ruler-bg": "#F0F0F0",
        "word-ruler-mark": "#999999",
        "word-ruler-margin": "#FFFFFF",
      },
      fontFamily: {
        sans: ["var(--font-segoe)", "Segoe UI", "system-ui", "sans-serif"],
      },
    },
  },
  plugins: [],
};

export default config;
