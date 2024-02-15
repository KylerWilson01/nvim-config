local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
local null_ls = require 'null-ls'

local opts = {
  sources = {
    null_ls.builtins.code_actions.eslint,
    null_ls.builtins.code_actions.refactoring,
    null_ls.builtins.code_actions.gomodifytags,
    null_ls.builtins.diagnostics.stylelint,
    null_ls.builtins.diagnostics.ruff,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.diagnostics.revive,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.goimports_reviser,
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.jq,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.csharpier,
  },
  on_attach = function(client, bufnr)
    if client.supports_method 'textDocument/formatting' then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }

      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}

return opts
