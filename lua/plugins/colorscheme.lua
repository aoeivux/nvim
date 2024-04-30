return {
  {
    -- "craftzdog/solarized-osaka.nvim",
    "askfiy/visual_studio_code",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        mode = "dark",
        -- Whether to load all color schemes
        preset = true,
        -- Whether to enable background transparency
        transparent = true,
      }
    end,
  },
}
