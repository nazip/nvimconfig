return {
  {
    "mistweaverco/kulala.nvim",
    tag = "v5.3.2",
    keys = {
      { "<leader>Rs", desc = "Send request" },
      { "<leader>Ra", desc = "Send all requests" },
      { "<leader>Rb", desc = "Open scratchpad" },
    },
    ft = { "http", "rest" },
    opts = {
      global_keymaps = true,
      global_keymaps_prefix = "<leader>R",
      kulala_keymaps_prefix = "",
      contenttypes = {
  ["application/json"] = {
    ft = "json",
    formatter = { "jq", "." },
    -- pathresolver = require("kulala.parser.jsonpath").parse,
  },
  ["application/xml"] = {
    ft = "xml",
    formatter = { "xmllint", "--format", "-" },
    pathresolver = { "xmllint", "--xpath", "{{path}}", "-" },
  },
  ["text/html"] = {
    ft = "html",
    formatter = { "xmllint", "--format", "--html", "-" },
    pathresolver = {},
  },
},
    },
  },
}
