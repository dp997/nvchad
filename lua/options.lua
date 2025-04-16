require "nvchad.options"

local o = vim.o

o.mouse = ""
o.clipboard = "unnamedplus"
o.swapfile = false
o.completeopt = "menuone,noinsert,noselect"
o.textwidth = 0
o.wrapmargin = 0
o.colorcolumn = "80"

-- folding
o.foldmethod = "indent"
o.foldcolumn = "0"
o.foldtext = ""
o.foldlevel = 99
o.foldlevelstart = 1
o.foldnestmax = 4
