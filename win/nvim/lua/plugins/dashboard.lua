return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  opts = {
    theme = 'hyper',
    config = {
      header = {
        [[                                          /$$              ]],
        [[                                         |__/              ]],
        [[ /$$$$$$$   /$$$$$$   /$$$$$$  /$$    /$$ /$$ /$$$$$$/$$$$ ]],
        [[| $$__  $$ /$$__  $$ /$$__  $$|  $$  /$$/| $$| $$_  $$_  $$]],
        [[| $$  \ $$| $$$$$$$$| $$  \ $$ \  $$/$$/ | $$| $$ \ $$ \ $$]],
        [[| $$  | $$| $$_____/| $$  | $$  \  $$$/  | $$| $$ | $$ | $$]],
        [[| $$  | $$|  $$$$$$$|  $$$$$$/   \  $/   | $$| $$ | $$ | $$]],
        [[|__/  |__/ \_______/ \______/     \_/    |__/|__/ |__/ |__/]],
        [[ ]],
        [[ ]],
      }, --your header
    }
  },
  config = function(_, opts)
    require('dashboard').setup(opts)
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
