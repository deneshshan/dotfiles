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

      -- colours
      vim.cmd([[
        hi clear DiffAdd
        hi DiffAdd gui=bold guifg=#709080 guibg=#313b36
        hi clear DiffChange
        hi DiffChange guibg=#332a2f
        hi clear DiffDelete
        hi DiffDelete gui=bold guibg=#332a2f
        hi clear DiffText
        hi DiffText gui=bold guifg=#ecbcbc guibg=#41363c
      ]])
    end,
  }
}
