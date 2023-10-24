return {
  {
    "HiPhish/nvim-ts-rainbow2",
    opts = {
      enable = true,
      query = 'rainbow-parens',
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup {
        rainbow = opts
      }
    end
  }
}
