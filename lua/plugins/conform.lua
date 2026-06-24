return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			yaml = { "yamlfmt" },
		},

		formatters = {
			yamlfmt = {
				-- Переносим YAML-конфигурацию прямо в Lua-аргументы
				args = function()
					return {
						"-formatter",
						"retain_line_breaks=true,scan_folded_as_literal=true,trim_trailing_whitespace=true",
						"-",
					}
				end,
			},
		},

		-- Полностью изолируем сохранение YAML от вмешательства LSP
		format_on_save = function(bufnr)
			return {
				timeout_ms = 500,
				lsp_format = "never",
			}
		end,
	},
}
