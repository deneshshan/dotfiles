return {
  {
    "tpope/vim-fugitive",
    config = function()
      local map = vim.api.nvim_set_keymap

      map("n", "<Leader>g", "<Cmd>Git<Space>|<Space>res<Space>10<CR>", {})
    end,
  }
}
