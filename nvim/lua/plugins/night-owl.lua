return {
  {
    "oxfist/night-owl.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      -- vim.o.termguicolors = true
      -- require("night-owl").setup()
      -- vim.cmd.colorscheme("night-owl")

      -- vim.api.nvim_set_hl(0, "@variable.ruby", { link = "@type" })
    end,
  }
}
