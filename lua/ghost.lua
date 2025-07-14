local M = {}

M.colors = {
  bg = "#25272d",
  fg = "#FFE7DE",
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

  -- Classic Vim/Neovim group for normal text and background.
  hi("Normal", { fg = c.fg, bg = c.bg }) -- Editor text/background.

  -- Treesitter highlights:

  hi("@comment", { fg = c.comment, italic = true }) -- Code comments, e.g. "# a comment", "// comment"
  hi("@function", { fg = c.blue }) -- Function name in definitions, e.g. "def my_func()"
  hi("@function.builtin", { fg = c.blue, italic = true }) -- Built-in functions, e.g. "print", "len"
  hi("@keyword", { fg = c.red, bold = true }) -- Language keywords, e.g. "if", "for", "return", "import"
  hi("@type", { fg = c.yellow }) -- Type names, e.g. "int", "str", "MyClass"
  hi("@variable", { fg = c.fg }) -- Generic variables, e.g. "my_var"
  hi("@variable.parameter", { fg = c.yellow }) -- Function parameters, e.g. "def foo(bar):"
  hi("@variable.builtin", { fg = c.orange }) -- Built-in variables, e.g. "self", "this", "None"
  hi("@constant", { fg = c.orange }) -- Constants, e.g. "PI", "MAX_LENGTH"
  hi("@constant.builtin", { fg = c.yellow }) -- Built-in constants, e.g. "True", "False", "None"
  hi("@string", { fg = c.green }) -- String literals, e.g. "'hello'", "\"world\""
  hi("@string.documentation", { fg = c.comment, italic = true }) -- Docstrings, e.g. Python's triple-quoted strings
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
  hi("@module", { fg = c.magenta }) -- Module names, e.g. "import math"
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
