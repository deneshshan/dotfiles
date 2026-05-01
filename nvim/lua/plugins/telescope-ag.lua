return {
  {
    "kelly-lin/telescope-ag",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      local map = vim.api.nvim_set_keymap

      map("n", "<Leader>ag", ":Ag<Space><C-r><C-w><CR>", {})
    end,
  }
}
