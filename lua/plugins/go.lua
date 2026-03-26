return {
  "ray-x/go.nvim",
  dependencies = { -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/cmp-nvim-lsp", -- cmp_nvim_lsp
  },
  opts = {
    -- lsp_keymaps = false,
    -- other options
  },
  config = function(lp, opts)

    local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
    require('go').setup({
      -- other setups ....
      lsp_cfg = {
        capabilities = capabilities,
        -- other setups
      },
      ai = { enable = true }, 
    })

    local gopls_cfg = require('go.lsp').config()
    -- gopls_cfg.filetypes = { 'go', 'gomod'}, -- override settings
    vim.lsp.config.gopls = gopls_cfg
    vim.lsp.enable('gopls')

    -- require("go").setup(opts)
    local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        require('go.format').goimports()
      end,
      group = format_sync_grp,
    })
  end,
  event = { "CmdlineEnter" },
  ft = { "go", 'gomod' },
  build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
}
