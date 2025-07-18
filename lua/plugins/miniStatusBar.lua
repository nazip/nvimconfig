return {
    {
        'echasnovski/mini.statusline',
        version = '*', opts = {}
    },
    {
        'echasnovski/mini-git',
        config = function()
            require('mini.git').setup()
        end 
    },
}
