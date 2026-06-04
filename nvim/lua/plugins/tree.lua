--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: plugins/tree.lua
-- Description: nvim-tree config
-- Author: Kien Nguyen-Tuan <kiennt2609@gmail.com>
-- disable netrw at the very start of your init.lua (strongly advised)
return { -- File explore
  -- nvim-tree.lua - A file explorer tree for neovim written in lua
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      lazy = true,
      opt = true
    },
    config = true,
    init = function(_, _)
      vim.keymap.set("n", "<Leader>nl", ":NvimTreeResize 100<CR>")
      vim.keymap.set("n", "<Leader>ns", ":NvimTreeResize 30<CR>")
      vim.keymap.set("n", "<Leader>nf", ":NvimTreeFocus<CR>")
      vim.keymap.set("n", "<Leader>nc", function()
        require("nvim-tree.api").tree.close_in_all_tabs()
      end, { desc = "Close NvimTree in all tabs" })
    end
  } }
