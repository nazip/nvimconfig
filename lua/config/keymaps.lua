vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Window navigation
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", { desc = "Go to right window" })
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", { desc = "Go to left window" })
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", { desc = "Go to upper window" })
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", { desc = "Go to lower window" })

-- Split window
vim.keymap.set("n", "|", ":vsplit<CR>", { desc = "Vertically split window" })
vim.keymap.set("n", "\\", ":split<CR>", { desc = "Horizontally split window" })

-- NvimTree
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', {})

-- Dbee
vim.keymap.set('n', '<Leader>OO', ':lua require("dbee").open()<CR>', { desc = "open Dbee" })
vim.keymap.set('n', '<Leader>O-', ':lua require("dbee").close()<CR>', { desc = "close Dbee" })
