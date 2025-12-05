-- return {
--   'lervag/vimtex',
--   lazy = false,
--   init = function()
--     -- vim.g.maplocalleader = ","
--     vim.g.vimtex_view_method = 'zathura'
--     vim.g.vimtex_compiler_method = 'latexmk'
--     vim.g.vimtex_bibtex_biber = 1
--     vim.o.foldmethod = 'expr'
--     vim.o.foldexpr = 'vimtex#fold#level(v:lnum)'
--     vim.o.foldlevel = 2
--     vim.o.foldenable = true
--     vim.g.vimtex_format_enabled = 0
--     vim.g.vimtex_quickfix_mode = 0
--   end,
--   config = function()
--     -- no keymaps here (they live in your keymaps file)
--     -- optionally set up LSP or other latex-related things
--     require('nvim-treesitter.configs').setup {
--       highlight = {
--         enable = true,
--         disable = { 'latex' },
--       },
--     }
--   end,
-- }
--
--
--
--
--
-- File: lua/plugins/vimtex.lua
return {
  'lervag/vimtex',
  lazy = false,
  init = function()
    -- Set local leader (used in keymaps, you already have your keymaps file)
    vim.g.maplocalleader = ','
    -- Viewer to use
    vim.g.vimtex_view_method = 'zathura'
    -- Compiler backend
    vim.g.vimtex_compiler_method = 'latexmk'
    -- If using biblatex + biber
    vim.g.vimtex_bibtex_biber = 1
    -- Folding settings (optional)
    vim.o.foldmethod = 'expr'
    vim.o.foldexpr = 'vimtex#fold#level(v:lnum)'
    vim.o.foldlevel = 2
    vim.o.foldenable = true
    -- Disable auto-format if you don’t want it
    vim.g.vimtex_format_enabled = 0
    -- Make quickfix less intrusive
    vim.g.vimtex_quickfix_mode = 0
  end,
  config = function()
    -- Optional LSP setup for LaTeX (if you want)
    -- Update: use vim.lsp.config API as per newer versions
    vim.lsp.config('texlab', {
      cmd = { 'texlab' },
      filetypes = { 'tex' },
    })
    vim.lsp.enable 'texlab'

    -- If using treesitter and want to avoid conflicts for LaTeX
    local ts = require 'nvim-treesitter.configs'
    ts.setup {
      highlight = {
        enable = true,
        disable = { 'latex' },
      },
    }
  end,
}
