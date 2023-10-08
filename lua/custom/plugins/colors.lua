rosepine = {
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

catppuccin = { 
  "catppuccin/nvim", 
  name = "catppuccin", 
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "mocha",
        dark = "mocha",
      },
      transparent_background = true, -- disables setting the background color.
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {},
      custom_highlights = {},
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = false,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    })

    vim.cmd.colorscheme "catppuccin"
  end
}

return catppuccin
