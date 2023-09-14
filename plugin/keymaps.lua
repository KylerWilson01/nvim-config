-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set('n', '<C-h>', '<cmd> TmuxNavigateLeft<CR>', { silent = true })
vim.keymap.set('n', '<C-l>', '<cmd> TmuxNavigateRight<CR>', { silent = true })
vim.keymap.set('n', '<C-j>', '<cmd> TmuxNavigateDown<CR>', { silent = true })
vim.keymap.set('n', '<C-k>', '<cmd> TmuxNavigateUp<CR>', { silent = true })

vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { silent = true })
