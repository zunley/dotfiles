-- Enable switching between terminal and other windows.
function _G.set_terminal_keymaps()
    local opts = {buffer = 0}
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

require('toggleterm').setup{
    open_mapping = [[<c-\>]],
    direction = 'float',
    shell = vim.o.shell ,
    insert_mappings = true,
    terminal_mappings = true,
    persist_mode = true,
}
