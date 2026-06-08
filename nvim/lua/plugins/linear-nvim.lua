return {
  {
    "rmanocha/linear-nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      require("linear-nvim").setup()

      vim.keymap.set("n", "<leader>ll", function()
        require("linear-nvim").show_assigned_issues()
      end, { desc = "Linear: list my assigned issues" })

      vim.keymap.set("n", "<leader>lc", function()
        require("linear-nvim").create_issue()
      end, { desc = "Linear: create issue" })

      vim.keymap.set("v", "<leader>lc", function()
        require("linear-nvim").create_issue()
      end, { desc = "Linear: create issue from selection" })

      vim.keymap.set("n", "<leader>ls", function()
        require("linear-nvim").show_issue_details()
      end, { desc = "Linear: show issue details under cursor" })
    end,
  },
}
