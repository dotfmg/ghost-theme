vim.cmd("highlight clear")
vim.cmd("set background=dark")
vim.g.colors_name = "ghost-theme"

local colors = require("colors.palette")

-- Classic Vim highlight groups (always include these)
vim.api.nvim_set_hl(0, "Normal", { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, "Comment", { fg = colors.comment, italic = true })
vim.api.nvim_set_hl(0, "Keyword", { fg = colors.keyword, italic = true })
vim.api.nvim_set_hl(0, "String", { fg = colors.string })
vim.api.nvim_set_hl(0, "Function", { fg = colors.func, bold = true })
vim.api.nvim_set_hl(0, "Type", { fg = colors.type })

-- Treesitter highlight groups
vim.api.nvim_set_hl(0, "@comment", { fg = colors.comment, italic = true })
vim.api.nvim_set_hl(0, "@keyword", { fg = colors.keyword, italic = true })
vim.api.nvim_set_hl(0, "@function", { fg = colors.func, bold = true })
vim.api.nvim_set_hl(0, "@string", { fg = colors.string })
vim.api.nvim_set_hl(0, "@variable", { fg = colors.variable })
vim.api.nvim_set_hl(0, "@type", { fg = colors.type })
vim.api.nvim_set_hl(0, "@number", { fg = colors.number })
vim.api.nvim_set_hl(0, "@constant", { fg = colors.constant })
vim.api.nvim_set_hl(0, "@parameter", { fg = colors.parameter, italic = true })

-- Optional: Link similar groups for less repetition:
vim.api.nvim_set_hl(0, "@field", { link = "@variable" })
vim.api.nvim_set_hl(0, "@property", { link = "@variable" })
vim.api.nvim_set_hl(0, "@namespace", { link = "@type" })
