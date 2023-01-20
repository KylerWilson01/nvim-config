local nnoremap = require'philbert.keymap'.nnoremap

nnoremap('gd', function()
    vim.lsp.buf.definition()
end)

nnoremap('gD', function()
    vim.lsp.buf.declaration()
end)

nnoremap('gr', function()
    vim.lsp.buf.references()
end)

nnoremap('gi', function()
    vim.lsp.buf.implementation()
end)

nnoremap('K', function()
    vim.lsp.buf.hover()
end)

nnoremap('<C-k>', function()
    vim.lsp.buf.signature_help()
end)

nnoremap('<C-p>', function()
    vim.diagnostic.goto_prev()
end)

nnoremap('<C-n>', function()
    vim.diagnostic.goto_next()
end)
