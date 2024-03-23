local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
local null_ls = require 'null-ls'

local opts = {
  sources = {
    null_ls.builtins.code_actions.refactoring,

    require 'none-ls.code_actions.eslint_d',
    require 'none-ls.diagnostics.eslint_d',
    null_ls.builtins.formatting.prettierd,

    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.mypy.with {
      extra_args = function()
        local virtual = os.getenv 'VIRTUAL_ENV' or '/usr'
        return { '--python-executable', virtual .. '/bin/python3' }
      end,
    },
    require 'none-ls.diagnostics.ruff',

    null_ls.builtins.diagnostics.revive,
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.goimports_reviser,
    null_ls.builtins.formatting.golines,
    null_ls.builtins.code_actions.gomodifytags,

    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.csharpier,
    null_ls.builtins.diagnostics.stylelint,
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
