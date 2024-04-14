local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
local null_ls = require 'null-ls'

local opts = {
  sources = {
    null_ls.builtins.code_actions.refactoring,

    require 'none-ls.code_actions.eslint_d',
    require 'none-ls.diagnostics.eslint_d',
    null_ls.builtins.formatting.prettierd.with {
      filetypes = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'vue',
        'css',
        'scss',
        'less',
        'html',
        'json',
        'jsonc',
        'yaml',
        'markdown',
        'markdown.mdx',
        'graphql',
        'handlebars',
        'svelte',
      },
    },

    null_ls.builtins.formatting.black,
    require 'none-ls.diagnostics.flake8',
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
