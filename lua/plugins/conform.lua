return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			yaml = { "yamlfmt", "prettier", stop_after_first = true },
		},

		-- Переопределяем поведение форматировщиков
		formatters = {
			yamlfmt = {
				-- Передаем флаг для сохранения пустых строк (line breaks)
				args = { "-formatter", "retain_line_breaks=true", "-" },
			},
		},

		-- Настройка форматирования при сохранении файла
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
