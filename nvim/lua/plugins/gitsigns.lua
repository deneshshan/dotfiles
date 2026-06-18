-- Config adapted from Kien Nguyen-Tuan's neovim config:
-- https://github.com/ntk148v/neovim-config
return { {
  -- Git integration for buffers
  "lewis6991/gitsigns.nvim",
  opts = {},
  ---@param opts TSConfig
  config = function(_, opts)
    require("gitsigns").setup(opts)
  end
} }
