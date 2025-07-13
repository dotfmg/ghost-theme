-- ~/.config/nvim/lua/plugins/ghost/lua/ghost.lua

local M = {}

M.colors = {
  bg = "#25272d",
  fg = "#cdd6f4",
  comment = "#585b70",
  red = "#f38ba8",
  green = "#a6e3a1",
  yellow = "#f9e2af",
  blue = "#89b4fa",
  magenta = "#f5c2e7",
  cyan = "#94e2d5",
  orange = "#fab387",
}

function M.setup()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.o.background = "dark"
  vim.g.colors_name = "ghost"

  local c = M.colors
  local function hi(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi("Normal", { fg = c.fg, bg = c.bg })
  hi("Comment", { fg = c.comment, italic = true })
  hi("String", { fg = c.green })
  hi("Function", { fg = c.blue })
  hi("Keyword", { fg = c.magenta, bold = true })
  hi("Type", { fg = c.yellow })
  -- ... add more highlights as needed

  -- Treesitter
  hi("@comment", { fg = c.comment, italic = true })
  hi("@function", { fg = c.blue })
  hi("@keyword", { fg = c.magenta, bold = true })
  hi("@type", { fg = c.yellow })
end

return M
