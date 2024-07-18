return {
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      colors = {
        fg = '#fff'
      }
    },
    init = function()
      vim.o.background = 'dark' -- or 'light'

      vim.cmd.colorscheme 'solarized'
    end,
    config = function()
      -- require('solarized').setup {
      --   highlights = function(colors, colorhelper)
      --     local lighten = colorhelper.lighten

      --     return {
      --       Function = { fg = lighten(colors.blue, 40) },
      --       Normal = { fg = colors.fg }
      --     }
      --   end
      -- }
    end,
  },
}
