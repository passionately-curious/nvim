-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- VimTeX keymaps
vim.keymap.set('n', '<localleader>ll', '<cmd>VimtexCompile<CR>', { desc = 'VimTeX: Compile' })
vim.keymap.set('n', '<localleader>lv', '<cmd>VimtexView<CR>', { desc = 'VimTeX: View' })
vim.keymap.set('n', '<localleader>li', '<cmd>VimtexInfo<CR>', { desc = 'VimTeX: Info' })
vim.keymap.set('n', '<localleader>lt', '<cmd>VimtexTocOpen<CR>', { desc = 'VimTeX: TOC' })

-- build and run
vim.keymap.set('n', '<leader>m', function()
  -- Save the current buffer
  vim.cmd 'write'

  -- Get the current file name and its directory
  local fname = vim.fn.expand '%:t' -- e.g., "main.c"
  local file_dir = vim.fn.expand '%:p:h' -- Get the directory of the current file

  -- Debugging: Print out the current file and directory
  print('Building and running:', fname)
  print('File directory:', file_dir)

  -- Run make in the file's directory inside a terminal split
  local cmd = string.format('botright split | terminal cd %s && make run SRC=%s', vim.fn.shellescape(file_dir), vim.fn.shellescape(fname))

  -- Debug output for the command
  print('Executing command:', cmd)

  -- Run the command
  vim.cmd(cmd)
  vim.cmd 'startinsert'
end, { noremap = true, silent = false, desc = 'Build & run current file' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Toggle showing all diagnostics (warnings/errors)
vim.keymap.set('n', '<leader>td', function()
  vim.diagnostic.enable(false) -- disable all diagnostics
end, { desc = 'Disable diagnostics' })

vim.keymap.set('n', '<leader>te', function()
  vim.diagnostic.enable() -- enable them again
end, { desc = 'Enable diagnostics' })
