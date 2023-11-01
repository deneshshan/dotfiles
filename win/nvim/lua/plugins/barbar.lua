return {
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    config = function()
      vim.g.barbar_auto_setup = false

      local map_opts = {
        noremap = true,
        silent = true,
      }

      local map = vim.api.nvim_set_keymap

      -- Move to previous/next
      map('n', '<Left>', '<Cmd>BufferPrevious<CR>', map_opts)
      map('n', '<Right>', '<Cmd>BufferNext<CR>', map_opts)
      -- Re-order to previous/next
      map('n', '<S-Left>', '<Cmd>BufferMovePrevious<CR>', map_opts)
      map('n', '<S-Right>', '<Cmd>BufferMoveNext<CR>', map_opts)
      -- Pin/unpin buffer
      map('n', '<S-p>', '<Cmd>BufferPin<CR>', map_opts)
      -- Close buffer
      map('n', '<S-c>', '<Cmd>BufferClose<CR>', map_opts)
    end,
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
}
