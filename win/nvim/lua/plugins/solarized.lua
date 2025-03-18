return {
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    ---@type solarized.config
    opts = {},
    config = function(_, opts)
      vim.o.termguicolors = true
      vim.o.background = 'dark'
      require('solarized').setup(opts)
      vim.cmd.colorscheme 'solarized'

      vim.cmd([[
        hi clear WinSeparator
        hi WinSeparator gui=bold guifg=#073642
        hi clear Type
        hi Type guifg=#6c71c4
        hi Parameter guifg=#859900
      ]])
    end,
  }
}
