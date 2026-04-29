return {
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    ---@type solarized.config
    opts = {},
    config = function(_, opts)
      -- vim.o.termguicolors = true
      -- vim.o.background = 'dark'
      -- require('solarized').setup(opts)
      -- vim.cmd.colorscheme 'solarized'

      -- vim.api.nvim_set_hl(0, "@keyword.function.ruby", { link = "@type.ruby" })
      -- -- vim.api.nvim_set_hl(0, "@variable.ruby", { link = "@string.ruby" })
      -- vim.api.nvim_set_hl(0, "Search", { bg = "NONE", underline = true })
      -- vim.api.nvim_set_hl(0, "CurSearch", { bg = "NONE", underline = true })
      -- vim.api.nvim_set_hl(0, "IncSearch", { bg = "NONE", underline = true })
      -- vim.cmd([[
      --   hi clear WinSeparator
      --   hi WinSeparator gui=bold guifg=#073642
      --   hi clear Type
      --   hi Type guifg=#6c71c4
      --   hi Parameter guifg=#859900
      -- ]])
    end,
  }
}
