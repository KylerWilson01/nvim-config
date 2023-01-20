require'philbert.lsp'
require'philbert.cmp'
require'philbert.telescope'
require'neogit'.setup{}

require'nvim-treesitter.configs'.setup { 
    indent = { enable = true }, 
    highlight = { enable = true }, 
    incremental_selection = { enable = true }, 
    textobjects = { enable = true }
}

require'todo-comments'.setup { 
    colors = { 
        error = { "DiagnosticError", "ErrorMsg", "#EB6F92" },
        warning = { "DiagnosticWarning", "WarningMsg", "#F6C177" },
        info = { "DiagnosticInfo", "#31748F" },
        hint = { "DiagnosticHint", "#9CCFD8" },
        default = { "Identifier", "#C4A7E7" },
        test = { "Identifier", "#EBBCBA" }
    }
}
