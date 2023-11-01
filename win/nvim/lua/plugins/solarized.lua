return {
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      styles = {
        comments = { italic = true },
        functions = { bold = true },
      }
    },
    init = function()
      vim.o.background = 'dark' -- or 'light'

      vim.cmd.colorscheme 'solarized'
    end,
    config = function(_, opts)
      require('solarized').setup(opts)
    end
  },
}
