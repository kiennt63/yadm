local o = vim.o
local bo = vim.bo
local wo  = vim.wo
local g = vim.g


g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

o.cursorline = true
o.ignorecase = true
o.termguicolors = true
o.syntax = 'on'
o.errorbells = false
o.smartcase = true
o.showmode = false
o.backup = false
o.undodir = vim.fn.stdpath('data') .. '/undodir'
o.undofile = true
o.incsearch = true
o.hidden = true
o.completeopt='menuone,noinsert,noselect'
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true

bo.autoindent = true
bo.smartindent = true
bo.swapfile = false

wo.number = true
wo.relativenumber = true
wo.signcolumn = 'yes'
wo.wrap = true
