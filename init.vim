set path+=**
set wildignore+=*_build/*
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*

call plug#begin("~/.local/share/nvim/site/autoload")

Plug 'rose-pine/neovim'
Plug 'folke/todo-comments.nvim'

Plug 'sbdchd/neoformat'
Plug 'TimUntersberger/neogit'

Plug 'ThePrimeagen/refactoring.nvim'

" telescope requirements
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

" Tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'nvim-treesitter/playground'
Plug 'wellle/context.vim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'darrikonn/vim-gofmt', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'
Plug 'akinsho/flutter-tools.nvim'

" cmp
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'

" vsnip
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

call plug#end()

lua require('philbert')

augroup SyntaxSettings
    autocmd!
    autocmd BufNewFile,BufRead *.jsx,*.tsx set filetype=typescriptreact
    autocmd BufNewFile,BufRead *.scss set filetype=scss
    autocmd BufWritePre * Neoformat
augroup END

let mapleader = ' ' 
