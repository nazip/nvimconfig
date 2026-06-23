return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			filters = {
				dotfiles = false, -- Set to false to show dotfiles
				git_ignored = false,
			},
			view = {
				width = 50,
			},

			on_attach = function(bufnr)
				local api = require("nvim-tree.api")

				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				-- Load default mappings first
				api.config.mappings.default_on_attach(bufnr)

				-- Add your custom width mappings here:
				vim.keymap.set("n", "+", ":vertical resize +5<CR>", opts("Increase Width"))
				vim.keymap.set("n", "-", ":vertical resize -5<CR>", opts("Decrease Width"))
			end,
		})
	end,
}
