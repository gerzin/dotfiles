return {
  "github/copilot.vim",
  event = "VimEnter",
  config = function()
    -- Enable Copilot for all file types
    vim.g.copilot_filetypes = {
      ["*"] = true,
    }

    -- Key mappings for Copilot
    vim.keymap.set('i', '<C-J>', '<Plug>(copilot-next)')
    vim.keymap.set('i', '<C-K>', '<Plug>(copilot-previous)')
    vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)')
    vim.keymap.set('i', '<C-H>', '<Plug>(copilot-dismiss)')

    -- Accept suggestion with Tab (but allow fallback)
    vim.keymap.set('i', '<Tab>', function()
      local suggestion = vim.fn['copilot#GetDisplayedSuggestion']()
      if suggestion.text ~= '' then
        return vim.fn['copilot#Accept']("")
      else
        return '<Tab>'
      end
    end, { expr = true, replace_keycodes = false })
  end,
}

