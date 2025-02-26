vim.keymap.set('i', '<C-l>', 'copilot#Accept("")', { expr = true, replace_keycodes = false })
vim.keymap.set('i', '<C-Space>', 'copilot#Suggest()', { expr = true, replace_keycodes = false })
vim.keymap.set('i', '<C-j>', 'copilot#Next()', { expr = true, silent = true })
vim.keymap.set('i', '<C-k>', 'copilot#Previous()', { expr = true, silent = true })
vim.g.copilot_no_tab_map = true
vim.g.copilot_enabled = false
