-- colors/ghost-theme.lua
vim.cmd("highlight clear")
vim.cmd("set background=dark")
vim.g.colors_name = "ghost-theme"

local colors = {
  bg = "#25272D",
  fg = "#FFFFFF",
  comment = "#5c6370",
  keyword = "#c678dd",
  string = "#98c379",
  func = "#61afef",
}

vim.api.nvim_set_hl(0, "Normal", { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, "Comment", { fg = colors.comment, italic = true })
vim.api.nvim_set_hl(0, "Keyword", { fg = colors.keyword, italic = true })
vim.api.nvim_set_hl(0, "String", { fg = colors.string })
vim.api.nvim_set_hl(0, "Function", { fg = colors.func, bold = true })
-- Add more highlight groups as needed!
