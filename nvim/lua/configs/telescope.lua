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
        live_grep = {
            theme = "ivy",
        },
        git_status = {
            theme = "ivy",
        },
    }
})

