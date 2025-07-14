local M = {}

M.colors = {
  bg = "#25272d",
  --fg = "#FFE7DE",
  --comment = "#5d606b",
  --red = "#e06c75",
  ---green = "#98c379",
  --yellow = "#e5c07b",
  --blue = "#61afef",
  --magenta = "#c678dd",
  --cyan = "#56b6c2",
  --orange = "#d19a66",
  visual = "#32343a",

  rosewater = "#F2D5CF",
  flamingo = "#EEBEBE",
  pink = "#F4B8E4",
  mauve = "#CA9EE6",
  maroon = "#EA999C",
  peach = "#EF9F76",
  --yellow = "#E5C890",
  --green = "#A6D189",
  --teal = "#81C8BE",
  sky = "#99D1DB",
  sapphire = "#85C1DC",
  --blue = "#8CAAEE",
  lavender = "#BABBF1",

  text = "#c6d0f5",
  subtext1 = "#b5bfe2",
  subtext0 = "#a5adce",
  overlay2 = "#949cbb",
  overlay1 = "#838ba7",
  overlay0 = "#737994",
  surface2 = "#626880",
  surface1 = "#51576d",
  surface0 = "#414559",

  base = "#303446",
  mantle = "#292C3C",
  crust = "#232634",

  bg_dark = "#1e2030",
  bg_dark1 = "#191B29",
  bg_highlight = "#2f334d",
  --blue = "#82aaff",
  blue0 = "#3e68d7",
  blue1 = "#65bcff",
  blue2 = "#0db9d7",
  blue5 = "#89ddff",
  blue6 = "#b4f9f8",
  blue7 = "#394b70",
  comment = "#636da6",
  cyan = "#86e1fc",
  dark3 = "#545c7e",
  dark5 = "#737aa2",
  fg = "#c8d3f5",
  fg_dark = "#828bb8",
  fg_gutter = "#3b4261",
  green = "#c3e88d",
  green1 = "#4fd6be",
  green2 = "#41a6b5",
  magenta = "#c099ff",
  magenta2 = "#ff007c",
  orange = "#ff966c",
  purple = "#fca7ea",
  red1 = "#c53b53",
  teal = "#4fd6be",
  terminal_black = "#444a73",
  yellow = "#ffc777",
  git = {
    add = "#b8db87",
    change = "#7ca1f2",
    delete = "#e26a75",
  },

  black = "#2E3440", -- nord0 in palette
  dark_gray = "#3B4252", -- nord1 in palette
  gray = "#434C5E", -- nord2 in palette
  light_gray = "#4C566A", -- nord3 in palette
  light_gray_bright = "#616E88", -- out of palette
  darkest_white = "#D8DEE9", -- nord4 in palette
  darker_white = "#E5E9F0", -- nord5 in palette
  white = "#ECEFF4", -- nord6 in palette
  --teal = "#8FBCBB", -- nord7 in palette
  off_blue = "#88C0D0", -- nord8 in palette
  glacier = "#81A1C1", -- nord9 in palette
  blue = "#5E81AC", -- nord10 in palette
  red = "#BF616A", -- nord11 in palette
  --orange = "#D08770", -- nord12 in palette
  --yellow = "#EBCB8B", -- nord13 in palette
  --green = "#A3BE8C", -- nord14 in palette
  --purple = "#B48EAD", -- nord15 in palette
  none = "NONE",
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

  -- Classic Vim/Neovim group for normal text and background.
  hi("Normal", { fg = c.fg, bg = c.bg }) -- Editor text/background.

  -- Treesitter highlights:

  hi("@comment", { fg = c.comment, italic = true }) -- Code comments, e.g. "# a comment", "// comment"
  hi("@function", { fg = c.blue }) -- Function name in definitions, e.g. "def my_func()"
  hi("@function.builtin", { fg = c.blue, italic = true }) -- Built-in functions, e.g. "print", "len"
  hi("@keyword", { fg = c.red, bold = true }) -- Language keywords, e.g. "if", "for", "return", "import"
  hi("@type", { fg = c.yellow }) -- Type names, e.g. "int", "str", "MyClass"
  hi("@variable", { fg = c.blue }) -- Generic variables, e.g. "my_var"
  hi("@variable.parameter", { fg = c.yellow }) -- Function parameters, e.g. "def foo(bar):"
  hi("@variable.builtin", { fg = c.orange }) -- Built-in variables, e.g. "self", "this", "None"
  hi("@constant", { fg = c.orange }) -- Constants, e.g. "PI", "MAX_LENGTH"
  hi("@constant.builtin", { fg = c.yellow }) -- Built-in constants, e.g. "True", "False", "None"
  hi("@string", { fg = c.green }) -- String literals, e.g. "'hello'", "\"world\""
  hi("@string.documentation", { fg = c.text, italic = true }) -- Docstrings, e.g. Python's triple-quoted strings
  hi("@string.regex", { fg = c.red }) -- Regex inside strings, e.g. r"\d+"
  hi("@string.escape", { fg = c.cyan }) -- Escape sequences in strings, e.g. "\n", "\t"
  hi("@number", { fg = c.orange }) -- Numbers, e.g. "42", "3.14"
  hi("@boolean", { fg = c.orange }) -- Boolean literals, e.g. "True", "False", "true", "false"
  hi("@character", { fg = c.green }) -- Character literals, e.g. "'a'"
  hi("@field", { fg = c.cyan }) -- Fields in structs/objects, e.g. "obj.field"
  hi("@property", { fg = c.cyan }) -- Object/class properties, e.g. ".property"
  hi("@parameter", { fg = c.yellow }) -- Function parameters, e.g. "def f(x):"
  hi("@punctuation", { fg = c.comment }) -- Punctuation (all), e.g. ",", ";", ":"
  hi("@punctuation.delimiter", { fg = c.yellow }) -- Delimiters, e.g. quotes ('", "'"), parentheses, braces, brackets
  hi("@punctuation.bracket", { fg = c.cyan }) -- Brackets/parens/braces, e.g. "()", "[]", "{}"
  hi("@punctuation.special", { fg = c.orange }) -- Special punctuation, e.g. "`", "@", "$"
  hi("@operator", { fg = c.red }) -- Operators, e.g. "+", "-", "*", "/", "=="
  hi("@constructor", { fg = c.yellow }) -- Constructors, e.g. "new MyClass()", "__init__"
  hi("@method", { fg = c.blue }) -- Methods, e.g. "obj.method()"
  hi("@namespace", { fg = c.magenta }) -- Namespaces/modules, e.g. "import sys", "package.module"
  hi("@module", { fg = c.yellow }) -- Module names, e.g. "import math"
  hi("@tag", { fg = c.red }) -- Tags, e.g. "<div>", "</html>"
  hi("@attribute", { fg = c.cyan }) -- Attributes, e.g. '<div id="main">'
  hi("@label", { fg = c.orange }) -- Labels, e.g. "case label:", "goto label"

  -- Diagnostics (LSP, linters)
  hi("DiagnosticError", { fg = c.red }) -- Error messages, e.g. syntax error underline
  hi("DiagnosticWarn", { fg = c.yellow }) -- Warning messages, e.g. unused variable
  hi("DiagnosticInfo", { fg = c.blue }) -- Info messages, e.g. code suggestions
  hi("DiagnosticHint", { fg = c.cyan }) -- Hints, e.g. style hints

  hi("LspReferenceText", { bg = c.visual }) -- LSP: referenced text (highlight when you search for references)
  hi("LspReferenceRead", { bg = c.visual }) -- LSP: read references
  hi("LspReferenceWrite", { bg = c.visual }) -- LSP: write references

  -- Completion/Popup menu UI
  hi("Pmenu", { bg = c.bg, fg = c.fg }) -- Popup menu background, e.g. completion menu
  hi("PmenuSel", { bg = c.visual, fg = c.fg }) -- Selected item in popup menu
  hi("PmenuThumb", { bg = c.comment }) -- Popup menu scrollbar

  -- Markdown and markup-specific highlights
  hi("@markup.heading", { fg = c.yellow, bold = true }) -- Markdown headings, e.g. "# Heading"
  hi("@markup.strong", { bold = true }) -- Markdown bold, e.g. "**bold**"
  hi("@markup.italic", { italic = true }) -- Markdown italic, e.g. "*italic*"
  hi("@markup.link", { fg = c.blue, underline = true }) -- Markdown links, e.g. "[text](url)"
  hi("@markup.list", { fg = c.orange }) -- Markdown list items, e.g. "- item", "* item"
end

return M
