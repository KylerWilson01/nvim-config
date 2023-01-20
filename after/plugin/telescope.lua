local nnoremap = require'philbert.keymap'.nnoremap
local builtin = require'telescope.builtin'

nnoremap('<C-t>', function() 
    builtin.git_files()
end)

nnoremap('<leader>tf', function() 
    require'telescope'.extensions.flutter.commands()
end)

nnoremap('<leader>tb', function() 
    builtin.buffers()
end)

nnoremap('<leader>tt', ':TodoTelescope<CR>')
