local telescope = require"telescope"
telescope.setup {
    pickers = {
        git_files = {
            theme = 'dropdown',
        },
        find_files = {
            theme = 'dropdown',
        },
        buffers = {
            theme = 'dropdown',
        }
    },
}

telescope.load_extension('flutter')
