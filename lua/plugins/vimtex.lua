return {
  'lervag/vimtex',
  lazy = false,
  ft = { 'tex', 'plaintex', 'bib' },
  init = function()
    vim.g.vimtex_view_method = 'sioyek'
    vim.g.vimtex_compiler_method = 'latexmk'
    vim.g.vimtex_view_sioyek_exe = 'sioyek'
  end,
}
