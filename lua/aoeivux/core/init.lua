require("aoeivux.core.basic")

vim.schedule(function()
  require("aoeivux.core.utils.plantuml").setup()
  require("aoeivux.core.utils.maven").setup()
  require("aoeivux.core.utils.jdtls").setup()
  require("aoeivux.core.utils.pandoc").setup()
end)
