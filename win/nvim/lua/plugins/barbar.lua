return {
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    opts = {
      noremap = true,
      silent = true,
    },
    config = function(_, opts)
      vim.g.barbar_auto_setup = false

      local map = vim.api.nvim_set_keymap

      -- Move to previous/next
      map('n', '<Left>', '<Cmd>BufferPrevious<CR>', opts)
      map('n', '<Right>', '<Cmd>BufferNext<CR>', opts)
      -- Re-order to previous/next
      map('n', '<S-Left>', '<Cmd>BufferMovePrevious<CR>', opts)
      map('n', '<S-Right>', '<Cmd>BufferMoveNext<CR>', opts)
      -- Pin/unpin buffer
      map('n', '<S-p>', '<Cmd>BufferPin<CR>', opts)
      -- Close buffer
      map('n', '<S-c>', '<Cmd>BufferClose<CR>', opts)
    end,
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
}
