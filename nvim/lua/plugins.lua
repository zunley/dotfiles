local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- why does't work.
    ui = {
        border = "single"
    },
    'nvim-tree/nvim-web-devicons',
    -- Colorscheme
	'marko-cerovac/material.nvim',
    -- Status Line
    'nvim-lualine/lualine.nvim',
    -- File Explorer
    'nvim-tree/nvim-tree.lua',
    -- buffer line
     {'akinsho/bufferline.nvim', version = "v3.*" },
    -- terminal
    "akinsho/toggleterm.nvim",
    -- lsp
    'neovim/nvim-lspconfig',
    -- treesitter
    'nvim-treesitter/nvim-treesitter',
    
    {
    'nvim-telescope/telescope.nvim', version = '0.1.1',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
})
