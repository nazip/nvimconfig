return {

  -- 2. Поддержка Go-плагинов от LazyVim
  { import = "lazyvim.plugins.extras.lang.go" },

  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      -- Строго переопределяем gofmt на gofumpt
      opts.formatters_by_ft.go = { "goimports", "gofumpt" }

      -- Настройки синхронного сохранения по стандарту LazyVim
      opts.format = {
        timeout_ms = 3000,
        async = false,
        quiet = false,
        lsp_fallback = false, -- Не даем gopls перебивать gofumpt
      }
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          formatting = false,
          settings = {
            gopls = {
              gofumpt = false,
            },
          },
        },
      },
    },
  },

  -- 5. Установка базовых парсеров Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "go",
        "gomod",
        "gowork",
        "gosum",
        "tsx",
        "typescript",
      })
    end,
  },

  -- 6. Дополнительные системные утилиты
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "shfmt",
        "gofumpt",
        "goimports",
      })
    end,
  },
}
