-- if nvim-tree is last buffer close it gracefully
local close_nvim_tree = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
end

local open_nvim_tree = function(data)
    local directory = vim.fn.isdirectory(data.file) == 1
    local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
    if not no_name and not directory then
        return
    end
    if directory then
        vim.cmd.cd(data.file)
    end
    require("nvim-tree.api").tree.open()
end

vim.keymap.set('n', '<F2>', ':NvimTreeToggle<cr>') -- open or close nvim-tree

local on_attach = function(bufnr)
    local api = require('nvim-tree.api')
    local opts = function(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    vim.keymap.set('n', '<TAB>',    api.node.open.preview,              opts('Open Preview'))
    vim.keymap.set('n', 'o',        api.node.open.edit,                 opts('Open'))
    vim.keymap.set('n', 'v',        api.node.open.vertical,             opts('Open: Vertical Split'))
    vim.keymap.set('n', 'y',        api.fs.copy.node,                   opts('Copy'))
    vim.keymap.set('n', 'p',        api.fs.paste,                       opts('Paste'))
    vim.keymap.set('n', 'a',        api.fs.create,                      opts('Create'))
    vim.keymap.set('n', 'd',        api.fs.remove,                      opts('Delete'))
    vim.keymap.set('n', 'r',        api.fs.rename,                      opts('Rename'))
    vim.keymap.set('n', 'P',        api.node.navigate.parent,           opts('Parent Directory'))
    vim.keymap.set('n', 'K',        api.node.show_info_popup,           opts('Info'))
    vim.keymap.set('n', 'R',        api.tree.reload,                    opts('Refresh'))
    vim.keymap.set('n', '<C-h>',    api.tree.toggle_hidden_filter,      opts('Toggle Dotfiles'))
    vim.keymap.set('n', '<C-f>',    api.tree.change_root_to_node,       opts('CD'))
end

require('nvim-tree').setup({
    auto_reload_on_write    = true,
    hijack_cursor           = false,
    sort_by                 = "case_sensitive",
    filters                 = {
        dotfiles = true,
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    },
    view = {
        --adaptive_size = true,
        hide_root_folder = false,
        side = 'left',
        mappings = {
            custom_only = true,
        },
    },
    on_attach = on_attach,
})
-- Close nvim-tree when closing the only remaining buf.
vim.api.nvim_create_autocmd({"BufEnter"}, { nested = true, callback = close_nvim_tree })
-- Open nvim-tree when when open a folder.
vim.api.nvim_create_autocmd({'VimEnter'}, { callback = open_nvim_tree })
