-- autoformat.lua
--
-- Use your language server to automatically format your code on save.
-- Adds additional commands as well to manage the behavior
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local languages = {
  typescriptreact = {
    require 'efmls-configs.linters.eslint_d',
    require 'efmls-configs.formatters.prettier',
  },
  typescript = {
    require 'efmls-configs.linters.eslint_d',
    require 'efmls-configs.formatters.prettier',
  },
  lua = {
    require 'efmls-configs.formatters.stylua',
  },
  c_sharp = {
    require 'efmls-configs.linters.mcs',
    require 'efmls-configs.formatters.dotnet_format',
  },
}

local efmls_config = {
  filetypes = vim.tbl_keys(languages),
  settings = {
    rootMarkers = { '.git/' },
    languages = languages,
  },
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
  },
}

require('lspconfig').efm.setup(vim.tbl_extend('force', efmls_config, {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    require('lsp-format').on_attach(client, bufnr)
  end,
}))
