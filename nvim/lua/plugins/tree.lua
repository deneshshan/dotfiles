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
    keys = {
      { "<C-n>",      "<cmd>NvimTreeToggle<cr>",     desc = "NvimTree toggle" },
      { "<leader>nr", "<cmd>NvimTreeRefresh<cr>",    desc = "NvimTree refresh" },
      { "<leader>nl", "<cmd>NvimTreeResize 100<cr>", desc = "NvimTree resize wide" },
      { "<leader>ns", "<cmd>NvimTreeResize 30<cr>",  desc = "NvimTree resize narrow" },
      { "<leader>nf", "<cmd>NvimTreeFindFile<cr>",   desc = "NvimTree focus" },
      {
        "<leader>nc",
        function()
          require("nvim-tree.api").tree.close_in_all_tabs()
        end,
        desc = "Close NvimTree in all tabs"
      },
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
  } }
