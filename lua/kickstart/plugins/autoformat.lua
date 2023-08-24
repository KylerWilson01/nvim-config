-- autoformat.lua
--
-- Use your language server to automatically format your code on save.
-- Adds additional commands as well to manage the behavior
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local async_formatting = function(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  vim.lsp.buf_request(
    bufnr,
    "textDocument/formatting",
    vim.lsp.util.make_formatting_params({}),
    function(err, res, ctx)
      if err then
        local err_msg = type(err) == "string" and err or err.message
        -- you can modify the log message / level (or ignore it completely)
        vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
        return
      end

      -- don't apply results if buffer is unloaded or has been modified
      if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
        return
      end

      if res then
        local client = vim.lsp.get_client_by_id(ctx.client_id)
        vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
        vim.api.nvim_buf_call(bufnr, function()
          vim.cmd("silent noautocmd update")
        end)
      end
    end
  )
end

local languages = {
  typescriptreact = {
    require('efmls-configs.linters.eslint_d'),
    require('efmls-configs.formatters.prettier'),
  },
  typescript = {
    require('efmls-configs.linters.eslint_d'),
    require('efmls-configs.formatters.prettier'),
  },
  lua = {
    require('efmls-configs.formatters.stylua'),
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

local LspAuGroup = vim.api.nvim_create_augroup("LspFormatting", {})

require('lspconfig').efm.setup(vim.tbl_extend('force', efmls_config, {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = LspAuGroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePost", {
        group = LspAuGroup,
        buffer = bufnr,
        callback = function()
          async_formatting(bufnr)
        end,
      })
    end
  end,
}))
