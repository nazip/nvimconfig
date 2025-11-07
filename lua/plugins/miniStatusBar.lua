return {
    {
        'echasnovski/mini.statusline',
        version = '*',
        opts = {}
    },
    {
        'echasnovski/mini-git',
        config = function()
            require('mini.git').setup()
        end
    },
    {
        'echasnovski/mini.icons',
        version = '*'
    },
    {
        'echasnovski/mini.nvim',
        version = '*'
    },
    -- {
    --     'nvim-mini/mini.pairs',
    --     version = '*',
    --     config = function()
    --         require('mini.pairs').setup()
    --     end
    -- },
}
