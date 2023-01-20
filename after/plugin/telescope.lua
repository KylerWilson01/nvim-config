local nnoremap = require'philbert.keymap'.nnoremap
local builtin = require'telescope.builtin'

nnoremap('<C-t>', function() 
    builtin.git_files()
end)

nnoremap('<Leader>tf', function() 
    require'telescope'.extensions.flutter.commands()
end)

nnoremap('<Leader>tb', function() 
    builtin.buffers()
end)

nnoremap('<leader>tt', ':TodoTelescope<CR>')
