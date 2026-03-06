return {
  "NeogitOrg/neogit",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required

    -- Only one of these is needed.
    "sindrets/diffview.nvim",        -- optional
 --   "esmuellert/codediff.nvim",      -- optional

    -- Only one of these is needed.
    "ibhagwan/fzf-lua",              -- optional
  },
  cmd = "Neogit",
  keys = {
    { "<leader>ng", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
  }
} 
