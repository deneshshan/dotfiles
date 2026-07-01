return {
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = {
      "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory",
      "DiffviewToggleFiles", "DiffviewRefresh"
    },
    keys = {
      { "<leader>eh", "<Cmd>DiffviewFileHistory %<CR>",
        desc = "Diffview: history of current file" },
      { "<leader>eH", "<Cmd>DiffviewFileHistory<CR>",   desc = "Diffview: history of whole repo" },
      { "<leader>ed", "<Cmd>DiffviewOpen<CR>",          desc = "Diffview: open working diff" },
    },
    opts = function()
      local actions = require("diffview.actions")
      return {
        enhanced_diff_hl = true,
        view = {
          merge_tool = { layout = "diff3_mixed" },
        },
        keymaps = {
          view = {
            { "n", "<leader>eo", actions.goto_file_edit, { desc = "Diffview: open file (close diffview)" } },
          },
          file_panel = {
            { "n", "<leader>eo", actions.goto_file_edit, { desc = "Diffview: open file (close diffview)" } },
          },
        },
      }
    end,
    config = function(_, opts)
      require("diffview").setup(opts)
    end,
  }
}
