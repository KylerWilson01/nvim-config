-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

local opts = vim.o

-- Set highlight on search
opts.hlsearch = false

-- Make line numbers default
vim.opt.nu = true
vim.wo.relativenumber = true

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
opts.clipboard = 'unnamedplus'

-- Enable break indent
opts.breakindent = true

-- Save undo history
opts.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
opts.ignorecase = true
opts.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
opts.updatetime = 250
opts.timeoutlen = 300

-- Set completeopt to have a better completion experience
opts.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
opts.termguicolors = true

opts.wrap = false
opts.scrolloff = 8
