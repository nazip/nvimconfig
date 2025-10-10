return {
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    {
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require 'cmp'
            cmp.setup({
                view = {
                    entries = 'native',
                },
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

                        -- For `mini.snippets` users:
                        -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
                        -- insert({ body = args.body }) -- Insert at cursor
                        -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
                        -- require("cmp.config").set_onetime({ sources = {} })
                    end,
                },
                window = {
                    documentation = false,
                    -- completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-p>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ['<Tab>'] = function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback() -- If you use vim-endwise, this fallback will behave the same as vim-endwise.
                        end
                    end,
                    ['<S-Tab>'] = function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback() -- If you use vim-endwise, this fallback will behave the same as vim-endwise.
                        end
                    end
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'vsnip' }, -- For vsnip users.
                    -- { name = 'luasnip' }, -- For luasnip users.
                    -- { name = 'ultisnips' }, -- For ultisnips users.
                    -- { name = 'snippy' }, -- For snippy users.
                }, {
                    { name = 'buffer',
                        option = {
                            get_bufnrs = function() return { vim.api.nvim_get_current_buf() } end
                        }
                    },
                })
            })

            local capabilities = require('cmp_nvim_lsp').default_capabilities() --nvim-cmp

            -- local on_attach = function(client, bufnr)
            --   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
            --   local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
            --
            --   buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
            -- end

            -- Setup lspconfig.


vim.lsp.config("gopls", {
  cmd = { "gopls" }, -- The command to start gopls
  root_markers = { "go.work", "go.mod", ".git" }, -- Markers to identify the project root
  filetypes = { "go" }, -- Filetypes for which this LSP server should be active
  settings = {
    gopls = {
      analyses = {
        -- fieldalignment = true,
        nilness = true,
        unusedwrite = true,
        unusedresult = true,
        unusedvariable = true,
        unusedparams = true,
        staticcheck = true,
        gofumpt = true,
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        -- parameterNames = true,
        rangeVariableTypes = true,
      },
      -- buildFlags = { "-tags=integration" }, -- Example build flags
      -- Add other gopls-specific settings here as needed
    },
  },
  -- on_attach = function(client, bufnr)
    -- Optional: Add buffer-local keybindings or other setup here
    -- For example, to set up completion or formatting
    -- require('cmp_nvim_lsp').setup({ client = client })
    -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- end,
})

-- Enable the gopls configuration
vim.lsp.enable("gopls")




            -- vim.lsp.config(
            --     'gopls',
            --     {
            --         cmd = {'gopls'},
            --             -- on_attach = on_attach,
            --         capabilities = capabilities,
            --         settings = {
            --             gopls = {
            --                 experimentalPostfixCompletions = true,
            --                 analyses = {
            --                     unusedparams = true,
            --                     shadow = true,
            --                 },
            --                 staticcheck = true,
            --             },
            --         },
            --         init_options = {
            --             usePlaceholders = true,
            --         }
            --     }
            -- )

        end
    }
}
