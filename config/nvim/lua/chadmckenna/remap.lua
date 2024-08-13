vim.g.mapleader = " "

vim.keymap.set('n', '<Esc>', "<cmd> noh <CR>", {})
vim.keymap.set('n', "<C-h>", "<C-w>h", {})
vim.keymap.set('n', "<C-l>", "<C-w>l", {})
vim.keymap.set('n', "<C-j>", "<C-w>j", {})
vim.keymap.set('n', "<Cn-k>", "<C-w>k", {})
vim.keymap.set('n', "<C-s>", "<cmd> w <CR>", {})

vim.keymap.set('n', "]e", ":m .+1<CR>==", {})
vim.keymap.set('n', "[e", ":m .-2<CR>==", {})

vim.keymap.set('v', "[e", ":m '<-2<CR>gv=gv", {})
vim.keymap.set('v', "]e", ":m '>+1<CR>gv=gv", {})
