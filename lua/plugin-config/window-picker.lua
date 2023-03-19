local status, window_picker = pcall(require, "window-picker")
if not status then
    vim.notify("没有找到 bufferline")
  return
end

-- local picked_window_id = require('window-picker').pick_window()

vim.keymap.set("n", "<leader>w", function()
    local picked_window_id = window_picker.pick_window() or vim.api.nvim_get_current_win()
    vim.api.nvim_set_current_win(picked_window_id)
end, { desc = "Pick a window" })
