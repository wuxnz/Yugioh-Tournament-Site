// credit to https://dev.to/tene/dark-mode-using-tailwindcss-v40-2lc6 for this code.

import { useState, useEffect, useCallback } from "react";

export default function useDarkMode() {
  const [isDarkMode, setIsDarkMode] = useState<boolean>(() => {
    const savedTheme = localStorage.getItem("theme");
    if (savedTheme) {
      return savedTheme === "dark";
    }
    return window.matchMedia("(prefers-color-scheme: dark)").matches;
  });

  // Toggle dark mode
  const toggleDarkMode = useCallback(() => {
    setIsDarkMode((prev) => {
      const newMode = !prev;
      const html = document.documentElement;
      if (newMode) {
        html.classList.add("dark");
        localStorage.setItem("theme", "dark");
      } else {
        html.classList.remove("dark");
        localStorage.setItem("theme", "light");
      }
      return newMode;
    });
  }, []);

  // Sync the theme with the <html> element
  useEffect(() => {
    const html = document.documentElement;
    if (isDarkMode) {
      html.classList.add("dark");
    } else {
      html.classList.remove("dark");
    }
  }, [isDarkMode]);

  return { isDarkMode, toggleDarkMode };
}
