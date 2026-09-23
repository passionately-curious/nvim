return {
  'Julian/lean.nvim',
  event = { 'BufReadPre *.lean', 'BufNewFile *.lean' },

  dependencies = {
    -- optional dependencies:

    -- 'nvim-telescope/telescope.nvim', -- for Lean-specific pickers
    -- 'andymass/vim-matchup',          -- for enhanced % motion behavior
    -- 'andrewradev/switch.vim',        -- for switch support
    -- 'tomtom/tcomment_vim',           -- for commenting
  },

  -- ---@type lean.Config
  config = function()
    vim.g.lean_config = { -- see the manual for full configuration options
      mappings = true,
    }
  end,
}
