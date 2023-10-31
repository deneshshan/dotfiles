return {
  {
    'fredeeb/tardis.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
    },
    opts = {
      keymap = {
        next = '<C-j>',   -- next entry in log (older)
        prev = '<C-k>',   -- previous entry in log (newer)
        quit = 'q',       -- quit all
        commit_message = 'm', -- show commit message for current commit in buffer
      },
      commits = 32,       -- max number of commits to read
    },
    config = function(_, opts)
      require('tardis-nvim').setup(opts)
    end
  }
}
