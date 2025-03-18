return {
  {
    "ThePrimeagen/harpoon",
    config = function()
      local map = vim.api.nvim_set_keymap

      map("n", "<Leader>ha", "<Cmd>lua<Space>require(\"harpoon.mark\").add_file()<CR>", {})
      map("n", "<Leader>hc", "<Cmd>lua<Space>require(\"harpoon.mark\").clear_all()<CR>", {})
      map("n", "<Leader>hq", "<Cmd>lua<Space>require(\"harpoon.ui\").toggle_quick_menu()<CR>", {})
      map("n", "<Leader>hn", "<Cmd>lua<Space>require(\"harpoon.ui\").nav_next()<CR>", {})
      map("n", "<Leader>hp", "<Cmd>lua<Space>require(\"harpoon.ui\").nav_prev()<CR>", {})
      map("n", "<Leader>ht", "<Cmd>Telescope<Space>harpoon<Space>marks<CR>", {})
    end
  }
}
