return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local harpoon = require 'harpoon'
    local conf = require('telescope.config').values
    local action_state = require 'telescope.actions.state'
    local action_utils = require 'telescope.actions.utils'
    local entry_display = require 'telescope.pickers.entry_display'
    local finders = require 'telescope.finders'

    local function filter_empty_string(list)
      local next = {}
      for idx = 1, #list do
        if list[idx].value ~= '' then
          table.insert(next, list[idx])
        end
      end

      return next
    end

    local generate_new_finder = function()
      return finders.new_table {
        results = filter_empty_string(harpoon:list().items),
        previewer = conf.file_previewer {},
        sorter = conf.generic_sorter {},
        entry_maker = function(entry)
          local line = entry.value .. ':' .. entry.context.row .. ':' .. entry.context.col
          local displayer = entry_display.create {
            separator = ' - ',
            items = {

              { width = 2 },
              { width = 50 },
              { remaining = true },
            },
          }
          local make_display = function()
            return displayer {
              tostring(entry.index),
              line,
            }
          end
          return {
            value = entry,
            ordinal = line,
            display = make_display,
            lnum = entry.row,
            col = entry.col,
            filename = entry.value,
          }
        end,
      }
    end

    local delete_harpoon_mark = function(prompt_bufnr)
      local confirmation = vim.fn.input(string.format 'Delete current mark(s)? [y/n]: ')
      if string.len(confirmation) == 0 or string.sub(string.lower(confirmation), 0, 1) ~= 'y' then
        print(string.format "Didn't delete mark")
        return
      end

      local selection = action_state.get_selected_entry()
      harpoon:list():remove(selection.value)

      local function get_selections()
        local results = {}
        action_utils.map_selections(prompt_bufnr, function(entry)
          table.insert(results, entry)
        end)
        return results
      end

      local selections = get_selections()
      for _, current_selection in ipairs(selections) do
        harpoon:list():remove(current_selection.value)
      end

      local current_picker = action_state.get_current_picker(prompt_bufnr)
      current_picker:refresh(generate_new_finder(), { reset_prompt = true })
    end

    harpoon:setup {}

    -- basic telescope configuration
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = generate_new_finder(),
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
          attach_mappings = function(_, map)
            map('i', '<c-d>', delete_harpoon_mark)
            map('n', '<c-d>', delete_harpoon_mark)

            return true
          end,
        })
        :find()
    end

    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():append()
    end, { silent = true, desc = '[H]arpoon mark [A]dd file' })

    vim.keymap.set('n', '<leader>hm', function()
      toggle_telescope(harpoon:list())
    end, { silent = true, desc = '[H]arpoon toggle [M]enue' })

    vim.keymap.set('n', '<leader>hv', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { silent = true, desc = '[H]arpoon [V]iew marks' })
  end,
}
