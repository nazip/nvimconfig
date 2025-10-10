return
{
    "rebelot/kanagawa.nvim",
    config = function()
        require("kanagawa").setup({
            compile = true,
            transparent = true,
            force_reverse_video_cursor = true,
            colors = {
		foreground = "#dcd7ba",
		background = "#1f1f28",

		cursor_bg = "#c8c093",
		cursor_fg = "#c8c093",
		cursor_border = "#c8c093",

		selection_fg = "#c8c093",
		selection_bg = "#2d4f67",

		scrollbar_thumb = "#16161d",
		split = "#16161d",

		ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
		brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
		indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
            },
        });
        overrides = function(colors)
            return {
                ["@markup.link.url.markdown_inline"] = { link = "Special" },      -- (url)
                ["@markup.link.label.markdown_inline"] = { link = "WarningMsg" }, -- [label]
                ["@markup.italic.markdown_inline"] = { link = "Exception" },      -- *italic*
                ["@markup.raw.markdown_inline"] = { link = "String" },            -- `code`
                ["@markup.list.markdown"] = { link = "Function" },                -- + list
                ["@markup.quote.markdown"] = { link = "Error" },                  -- > blockcode
                ["@markup.list.checked.markdown"] = { link = "WarningMsg" }       -- - [X] checked list item
            }
        end
        vim.cmd("colorscheme kanagawa")
    end,
    build = function()
        vim.cmd("KanagawaCompile")
    end
}
