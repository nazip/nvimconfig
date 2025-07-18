return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {
        indent = { char = "┊" },
        scope = {
            enabled = true,
            show_start = false,
            show_end = false,
            highlight = "Visual",
        },
        exclude = {
            filetypes = { "help", "alpha", "dashboard", "lazy", "mason", "neo-tree" },
            buftypes = { "terminal" },
        },
    },
}
