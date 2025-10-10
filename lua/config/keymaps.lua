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
vim.keymap.set('n', '<leader>RR', ':NvimTreeRefresh<CR>', {})

-- Dbee
vim.keymap.set('n', '<Leader>OO', ':lua require("dbee").open()<CR>', { desc = "open Dbee" })
vim.keymap.set('n', '<Leader>O-', ':lua require("dbee").close()<CR>', { desc = "close Dbee" })

-- golang
vim.keymap.set('n', '<Leader>gR', ':GoRun ./cmd <CR>', { desc = "run Go file" })
vim.keymap.set('n', '<Leader>gC', ':GoCoverageToggle<CR>', { desc = "toggle Go coverage" })
vim.keymap.set('n', '<Leader>gT', ':GoTest<CR>', { desc = "run Go test" })
vim.keymap.set('n', '<Leader>gB', ':GoBuild ./cmd/main.go <CR>', { desc = "build Go file" })
vim.keymap.set('n', '<Leader>gg', ':GoGenerate<CR>', { desc = "genearate moke for Go" })
vim.keymap.set('n', '<Leader>gI', ':GoInstall<CR>', { desc = "install Go package" })
vim.keymap.set('n', '<Leader>gD', ':GoDoc<CR>', { desc = "show Go doc" })
vim.keymap.set('n', '<Leader>gF', ':GoFmt<CR>', { desc = "format Go file" })
vim.keymap.set('n', '<Leader>gI', ':GoImport<CR>', { desc = "import Go package" })
vim.keymap.set('n', '<Leader>gt', ':GoAddTag<CR>', { desc = "add tags to Go struct" })
vim.keymap.set('n', '<Leader>gt-', ':GoRmTag<CR>', { desc = "remove tags from Go struct" })

-- grpc
vim.keymap.set('n', '<leader>gr', ':Grpc<CR>', {desc = "exec grpc url"})
