return {
  {
    "tpope/vim-fugitive",
    config = function()
      local map = vim.api.nvim_set_keymap

      map("n", "<Leader>gg", "<Cmd>Git<Space>|<Space>res<Space>10<CR>", {})
      map("n", "<Leader>gv", "<Cmd>Gvdiffsplit<CR>", {})
      map("n", "<leader>gl", "<Cmd>0GlLog<CR>", {})
      map("n", "<leader>gb", "<Cmd>:Git blame<CR>", {})
      vim.cmd([[
        vmap <leader>gp :'<,'>diffput<CR>
      ]])
    end,
  }
}
