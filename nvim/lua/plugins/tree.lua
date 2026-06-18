-- Config adapted from Kien Nguyen-Tuan's neovim config:
-- https://github.com/ntk148v/neovim-config
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
    opts = {
      filesystem_watchers = {
        -- This list REPLACES nvim-tree's defaults, so keep the useful ones.
        -- Excludes big gitignored Rails dirs so Shift+I (show git-ignored)
        -- doesn't spin up thousands of fs_event watchers over tmp/.
        ignore_dirs = {
          "/.git", "/node_modules", "/target", "/build",
          "/tmp", "/log", "/storage", "/vendor",
        },
      },
    },
    init = function(_, _)
      vim.keymap.set("n", "<Leader>nl", ":NvimTreeResize 100<CR>")
      vim.keymap.set("n", "<Leader>ns", ":NvimTreeResize 30<CR>")
      vim.keymap.set("n", "<Leader>nf", ":NvimTreeFocus<CR>")
      vim.keymap.set("n", "<Leader>nc", function()
        require("nvim-tree.api").tree.close_in_all_tabs()
      end, { desc = "Close NvimTree in all tabs" })
    end
  } }
