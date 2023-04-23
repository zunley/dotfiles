vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')
vim.opt.number          = true
vim.opt.relativenumber  = true
vim.opt.termguicolors   = true
vim.opt.cursorline      = true
vim.opt.swapfile        = false

vim.opt.autoindent  = true
vim.opt.shiftround  = true
vim.opt.tabstop     = 4
vim.opt.shiftwidth  = 4
vim.opt.softtabstop = 4
vim.opt.mouse       = 'c'
vim.opt.expandtab   = true
vim.opt.autowrite   = true -- auto save

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- global keymaps
vim.g.mapleader = ';'
vim.keymap.set('n', '<C-h>', ':bp<cr>')
vim.keymap.set('n', '<C-l>', ':bn<cr>')
vim.keymap.set('n', '<leader>d', ':bp | bd #<cr>')
vim.keymap.set('n', '<leader>q', ':q<cr>')
vim.keymap.set('n', '<leader>w', ':w<cr>')
-- move curse in insert mod
vim.keymap.set('i', '<C-h>', '<left>')
vim.keymap.set('i', '<C-l>', '<right>')
vim.keymap.set('i', '<C-k>', '<up>')
vim.keymap.set('i', '<C-j>', '<down>')

-- load lua/plugins.lua
require('plugins')
require('configs.lsp')
require('configs.lualine')
require('configs.nvimtree')
require('configs.bufferline')
require('configs.toggleterm')
require('configs.treesitter')
require('configs.telescope')

-- colors
vim.g.material_style = "oceanic"
vim.cmd('colorscheme material')

-- tagbar
vim.keymap.set('n', '<F8>', ':TagbarToggle<cr>')
