local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fw', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fa', function()
  builtin.live_grep({ hidden = true, file_ignore_patterns = { 'node_modules', '.git' }, smart_case = true })
end)
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-\\>', function()
  builtin.find_files({ hidden = true, file_ignore_patterns = { 'node_modules', '.git' } })
end)
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>\\', "<cmd> lua require'telescope.builtin'.grep_string({ smart_case = true })<CR>")
vim.keymap.set('v', '<C-\\>', "<cmd> lua require'telescope.builtin'.grep_string({ smart_case = true })<CR>")
vim.keymap.set('n', '<leader>gd', function()
  builtin.lsp_definitions({jump_type = "vsplit"})
end)

