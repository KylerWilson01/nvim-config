return {
  'rose-pine/neovim',
  name = 'rose-pine',
  config = function()
    require('rose-pine').setup {
      variant = 'main',
      dark_variant = 'main',
      bold_vert_split = false,
      dim_nc_background = true,
      disable_background = true,
      disable_float_background = false,
      disable_italics = true,

      groups = {
        background = 'base',
        background_nc = '_experimental_nc',
        panel = 'surface',
        panel_nc = 'base',
      },

      highlight_groups = {
        ColorColumn = { bg = 'iris' },

        -- Blend colours against the "base" background
        CursorLine = { bg = 'foam', blend = 10 },
        StatusLine = { fg = 'subtle', bg = 'subtle', blend = 10 },
      },
    }
    vim.o.termguicolors = true
    vim.cmd.colorscheme 'rose-pine'

    vim.cmd [[
      hi Normal guibg=NONE ctermbg=NONE
      hi NonText guibg=NONE ctermbg=NONE
      hi EndOfBuffer guibg=NONE ctermbg=NONE
      hi NormalNC guibg=NONE ctermbg=NONE
      ]]
    vim.cmd [[hi LineNr guifg=#5eacd3]]
    vim.cmd [[hi netrwDir guifg=#5eacd3]]
    vim.cmd [[hi qfFileName guifg=#aed75f]]
    vim.cmd [[hi TelescopeBorder guifg=#5eacd]]
    vim.cmd [[hi ColorColumn ctermbg=0 guibg=grey]]
    vim.cmd [[hi SignColumn guibg=none]]
  end,
}

