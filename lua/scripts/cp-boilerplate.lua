local M = {}

local template_path =
  vim.fn.expand("~/Matrix/competitive-programming/templates/template.cpp")

-- Create new file from template
function M.new_file_from_template()
  local filename = vim.fn.input("File name: ")

  if filename == "" then
    return
  end

  local target = vim.fn.getcwd() .. "/" .. filename

  -- prevent overwrite
  if vim.fn.filereadable(target) == 1 then
    print("File already exists: " .. filename)
    return
  end

  local lines = vim.fn.readfile(template_path)
  vim.fn.writefile(lines, target)

  vim.cmd("edit " .. target)
end

-- Paste template into current buffer
function M.paste_template()
  local lines = vim.fn.readfile(template_path)

  local row = vim.api.nvim_win_get_cursor(0)[1]

  vim.api.nvim_buf_set_lines(0, row, row, false, lines)
end

return M
