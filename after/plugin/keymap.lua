local Keymap = require'philbert.keymap'
local neogit = require'neogit'
local nnoremap = Keymap.nnoremap
local vnoremap = Keymap.vnoremap
local inoremap = Keymap.inoremap

nnoremap('n', 'nzzzv')
nnoremap('N', 'Nzzzv')
nnoremap('<c-d>', '<c-d>zzzv')
nnoremap('<c-u>', '<c-u>zzzv')
nnoremap('<leader>e', ':Ex<CR>')
inoremap('<c-c>', '<c-[>')

nnoremap('<leader>y', '"+y')
vnoremap('<leader>y', '"+y')
nnoremap('<leader><CR>', ':so ~/.config/nvim/init.vim<CR>')
nnoremap('<leader>nf', ':Neoformat<CR>')

nnoremap('<leader>gs', function()
    neogit.open({})
end)

nnoremap('<leader>ga', '<cmd>!git fetch --all<CR>')
