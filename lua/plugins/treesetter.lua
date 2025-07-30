return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        {"nvim-treesitter/nvim-treesitter-textobjects"}, -- Syntax aware text-objects
        {
            "nvim-treesitter/nvim-treesitter-context", -- Show code context
            opts = {
                enable = true,
                mode = "topline",
                line_numbers = true
            }
        }
    },
    config = function ()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "c", "go", "lua", "vim", "vimdoc", "query", "heex", "javascript", "html"
            },
            auto_install = true,
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            textobjects = {select = {enable = true, lookahead = true}},
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<Enter>", -- set to `false` to disable one of the mappings
                    node_incremental = "<Enter>",
                    scope_incremental = false,
                    node_decremental = "<Backspace>",
                },
            },
        })
    end
}
