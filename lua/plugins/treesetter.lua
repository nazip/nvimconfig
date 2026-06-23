return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"go",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"heex",
			"javascript",
			"html",
		},
		auto_install = true,
	},
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			branch = "main",
			init = function()
				vim.g.no_plugin_maps = true
			end,
		},
		{
			"nvim-treesitter/nvim-treesitter-context",
			opts = {
				enable = true,
				mode = "topline",
				line_numbers = true,
			},
		},
	},
	config = function(_, opts)
		-- Настраиваем парсеры
		require("nvim-treesitter").setup({
			highlight = { enable = true },
			indent = { enable = true },
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ao"] = "@comment.outer",
						["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
						["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
					},
					selection_modes = {
						["@parameter.outer"] = "v",
						["@function.outer"] = "V",
						["@class.outer"] = "<c-v>",
					},
					include_surrounding_whitespace = true,
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>a"] = { query = "@parameter.inner", desc = "Swap with next parameter" },
					},
					swap_previous = {
						["<leader>A"] = "@parameter.inner",
					},
				},
			},
		})

		-- НАСТРОЙКА ИНКРЕМЕНТАЛЬНОГО ВЫДЕЛЕНИЯ (ПОЛНОЕ ИСКЛЮЧЕНИЕ ДЛЯ HTML)
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "*",
			callback = function(ev)
				-- ИСКЛЮЧЕНИЕ: Если файл HTML, мы вообще не трогаем Enter.
				-- Он не будет переходить в визуальный режим и не перехватит работу других плагинов.
				-- if ev.notmatch ~= "go" and ev.notmatch ~= "yaml" and ev.notmatch ~= "yml" then
				-- 	return
				-- end

				-- Для ВСЕХ ОСТАЛЬНЫХ файлов настраиваем умное выделение по Enter
				local opts_local = { buffer = ev.buf, silent = true }

				-- Normal режим: Нажали Enter -> выделился минимальный блок кода (перешли в Visual)
				vim.keymap.set("n", "<CR>", function()
					pcall(function()
						require("vim.treesitter._select").select_parent()
					end)
				end, vim.tbl_extend("force", opts_local, { desc = "Init/Increment selection" }))

				-- Visual режим: Нажимаем Enter дальше -> выделение расширяется по синтаксису
				vim.keymap.set("x", "<CR>", function()
					pcall(function()
						require("vim.treesitter._select").select_parent()
					end)
				end, vim.tbl_extend("force", opts_local, { desc = "Increment selection" }))

				-- Visual режим: Нажали Backspace -> выделение уменьшилось на шаг назад
				vim.keymap.set("x", "<BS>", function()
					pcall(function()
						require("vim.treesitter._select").select_child()
					end)
				end, vim.tbl_extend("force", opts_local, { desc = "Decrement selection" }))
			end,
		})
	end,
}
