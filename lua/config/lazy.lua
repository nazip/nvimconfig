-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.terminal_emulator = "wezterm"

require("config/options")

-- autoformatting
-- vim.api.nvim_create_autocmd("LspAttach", {
--  group = vim.api.nvim_create_augroup("lsp", { clear = true }),
--  callback = function(args)
--    -- 2
--    vim.api.nvim_create_autocmd("BufWritePre", {
--      -- 3
--      buffer = args.buf,
--      callback = function()
--        -- 4 + 5
--        vim.lsp.buf.format { async = false, id = args.data.client_id }
--      end,
--    })
--  end
--})

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "canagawa" } },
	-- automatically check for plugin updates
	checker = { enabled = true },

	config = function()
		-- Run gofmt + goimports on save
		local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.go",
			callback = function()
				require("go.format").goimports()
			end,
			group = format_sync_grp,
		})
	end,
})

require("config/keymaps")


vim.filetype.add({
  extension = { pdf = "pdf" },
})

vim.api.nvim_create_autocmd("BufReadCmd", {
  pattern = "*.pdf",
  callback = function()
    local file_path = vim.fn.shellescape(vim.api.nvim_buf_get_name(0))
    
    if vim.fn.has("mac") == 1 then
      -- macOS: Открывает PDF напрямую в Google Chrome (или замените на ваш браузер)
      vim.fn.jobstart("open -a 'Google Chrome' " .. file_path, { detach = true })
    elseif vim.fn.has("linux") == 1 then
      -- Linux: Открывает напрямую в Chrome / Chromium
      -- Если используете Firefox, замените на "firefox"
      vim.fn.jobstart("google-chrome-stable " .. file_path, { detach = true })
    end
    
    -- Мгновенно закрываем бинарный буфер в Neovim
    local bufnr = vim.api.nvim_get_current_buf()
    vim.cmd("bdelete! " .. bufnr)
  end,
})

-- 1. Регистрируем расширения файлов Word и Excel
vim.filetype.add({
  extension = {
    doc  = "msword",
    docx = "msword",
    xls  = "msexcel",
    xlsx = "msexcel",
  },
})

-- 2. Перехватываем открытие документов, запускаем LibreOffice и восстанавливаем окна
vim.api.nvim_create_autocmd("BufReadCmd", {
  pattern = { "*.doc", "*.docx", "*.xls", "*.xlsx" },
  callback = function()
    local file_path = vim.api.nvim_buf_get_name(0)
    local escaped_path = vim.fn.shellescape(file_path)
    local bufnr = vim.api.nvim_get_current_buf()

    -- Запускаем LibreOffice в фоне (он сам поймет: Writer или Calc)
    if vim.fn.has("mac") == 1 then
      vim.fn.jobstart("open -a 'LibreOffice' " .. escaped_path, { detach = true })
    elseif vim.fn.has("linux") == 1 then
      vim.fn.jobstart("libreoffice " .. escaped_path .. " >/dev/null 2>&1", { detach = true })
    end

    -- Возвращаем структуру окон в исходное состояние
    vim.schedule(function()
      if vim.api.nvim_buf_is_valid(bufnr) then
        -- Находим предыдущий рабочий буфер для этого окна
        local alt_buf = vim.fn.bufnr("#")
        
        if alt_buf > 0 and vim.api.nvim_buf_is_valid(alt_buf) then
          vim.api.nvim_set_current_buf(alt_buf)
        else
          vim.cmd("silent! EditAlternate")
        end
        
        -- Удаляем бинарный буфер таблицы, сохраняя геометрию сплитов
        vim.cmd("keepalt bdelete! " .. bufnr)
      end
    end)
  end,
})
