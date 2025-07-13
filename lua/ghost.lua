-- ~/.config/nvim/lua/plugins/ghost/lua/ghost.lua

local M = {}

M.colors = {
  bg = "#25272d",
  fg = "#e0e2e6",
  comment = "#5d606b",
  red = "#e06c75",
  green = "#98c379",
  yellow = "#e5c07b",
  blue = "#61afef",
  magenta = "#c678dd",
  cyan = "#56b6c2",
  orange = "#d19a66",
  visual = "#32343a",
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
  -- hi("Comment", { fg = c.comment, italic = true })
  -- hi("String", { fg = c.green })
  -- hi("Function", { fg = c.blue })
  -- hi("Keyword", { fg = c.magenta, bold = true })
  -- hi("Type", { fg = c.yellow })
  -- ... add more highlights as needed

  -- Treesitter
  hi("@comment", { fg = c.comment, italic = true })
  hi("@function", { fg = c.blue })
  hi("@keyword", { fg = c.red, bold = true })
  hi("@type", { fg = c.yellow })
  hi("@variable", { fg = c.fg }) -- variables
  hi("@variable.builtin", { fg = c.orange }) -- built-in variables (e.g. `self`, `this`)
  hi("@constant", { fg = c.orange }) -- constants
  hi("@constant.builtin", { fg = c.yellow }) -- built-in constants (e.g. `true`, `false`)
  hi("@string", { fg = c.fg }) -- strings
  hi("@string.regex", { fg = c.red }) -- regex strings
  hi("@string.escape", { fg = c.cyan }) -- escape sequences
  hi("@number", { fg = c.orange }) -- numbers
  hi("@boolean", { fg = c.orange }) -- booleans
  hi("@character", { fg = c.green }) -- chars
  hi("@field", { fg = c.cyan }) -- struct/object fields
  hi("@property", { fg = c.cyan }) -- properties
  hi("@parameter", { fg = c.yellow }) -- function parameters
  hi("@punctuation", { fg = c.comment }) -- punctuation
  hi("@punctuation.delimiter", { fg = c.yellow })
  hi("@punctuation.bracket", { fg = c.cyan })
  hi("@punctuation.special", { fg = c.orange })
  hi("@operator", { fg = c.red }) -- operators (+, -, etc)
  hi("@constructor", { fg = c.yellow }) -- constructors
  hi("@method", { fg = c.blue }) -- methods
  hi("@namespace", { fg = c.magenta }) -- namespaces, modules
  hi("@module", { fg = c.magenta }) -- modules
  hi("@tag", { fg = c.red }) -- tags (HTML/XML)
  hi("@attribute", { fg = c.cyan }) -- attributes
  hi("@label", { fg = c.orange }) -- labels (goto, etc.)
end

return M
