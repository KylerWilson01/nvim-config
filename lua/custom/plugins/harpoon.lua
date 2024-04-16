return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup {}

    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
    end, { silent = true, desc = '[H]arpoon mark [A]dd file' })

    vim.keymap.set('n', '<leader>hm', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { silent = true, desc = '[H]arpoon toggle [M]enue' })
  end,
}
