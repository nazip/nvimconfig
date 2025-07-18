return {
  "kndndrj/nvim-dbee",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  build = function()
    -- Install tries to automatically detect the install method.
    -- if it fails, try calling it with one of these parameters:
    --    "curl", "wget", "bitsadmin", "go"
    require("dbee").install()
  end,
  config = function()
    require("dbee").setup({
      sources = {
        require("dbee.sources").EnvSource:new("DBEE_CONNECTIONS"),
      },
    })
    vim.keymap.set('n', '<Leader>OO', ':lua require("dbee").open()<CR>', {desc = "open Dbee"})
    vim.keymap.set('n', '<Leader>O-', ':lua require("dbee").close()<CR>', {desc = "close Dbee"})
  end,
}
