return {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], { buffer = 0 }),
        vim.keymap.set('t', 'jk', [[<C-\><C-n>]], { buffer = 0 }),
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], { buffer = 0 }),
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], { buffer = 0 }),
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], { buffer = 0 }),
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], { buffer = 0 }),
        vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], { buffer = 0 }),
        -- vim.keymap.set('n', '<C-t>', ':ToggleTerm<CR>', {}),
        -- vim.keymap.set('t', '<C-t>', 'exit<CR>', {}),
        open_mapping = [[<C-t>]], 
        shade_terminals = true,

    },

}
