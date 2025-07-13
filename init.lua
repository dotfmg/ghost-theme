-- ~/.config/nvim/lua/plugins/ghost/init.lua

return {
  name = "ghost",
  lazy = false,
  priority = 1000,
  config = function()
    require("plugins.ghost.lua.ghost").setup()
  end,
}
