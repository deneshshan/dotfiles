return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      vim.o.termguicolors = true
      vim.cmd("colorscheme rose-pine")

      vim.api.nvim_set_hl(0, "@variable.ruby", { link = "@type" })
      vim.api.nvim_set_hl(0, "@string.special.symbol.ruby", { link = "@comment.error" })
      vim.api.nvim_set_hl(0, "Search", { bg = "NONE", underline = true })
      vim.api.nvim_set_hl(0, "CurSearch", { bg = "NONE", underline = true })
      vim.api.nvim_set_hl(0, "IncSearch", { bg = "NONE", underline = true })
    end
  }
}
