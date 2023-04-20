-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fh', builtin.git_status, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ['<C-j>'] = 'move_selection_next',
                ['<C-k>'] = 'move_selection_previous'
            }
        },
    },
    pickers = {
        find_files = {
            theme = "ivy",
            hidden = true,
            no_ignore = true,
            no_ignore_parent = true
        },
        buffers = {
            theme = "ivy",
        },
    }
})

