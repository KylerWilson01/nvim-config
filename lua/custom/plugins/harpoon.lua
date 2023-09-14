return {
  'ThePrimeagen/harpoon',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require 'harpoon'.setup {}

    vim.keymap.set('n', '<leader>ha', require('harpoon.mark').add_file,
      { silent = true, desc = '[H]arpoon mark [A]dd file' })
    vim.keymap.set('n', '<leader>hm', require('harpoon.ui').toggle_quick_menu,
      { silent = true, desc = '[H]arpoon toggle [M]enue' })
    vim.keymap.set('n', '<leader>hh', function()
      require('harpoon.ui').nav_file(1)
    end, { silent = true, desc = '[H]arpoon first file' })
    vim.keymap.set('n', '<leader>ht', function()
      require('harpoon.ui').nav_file(2)
    end, { silent = true, desc = '[H]arpoon second file' })
    vim.keymap.set('n', '<leader>hn', function()
      require('harpoon.ui').nav_file(3)
    end, { silent = true, desc = '[H]arpoon third file' })
    vim.keymap.set('n', '<leader>hs', function()
      require('harpoon.ui').nav_file(4)
    end, { silent = true, desc = '[H]arpoon fourth file' })
  end,
}
