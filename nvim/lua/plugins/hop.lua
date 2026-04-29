return {
  {
    'smoka7/hop.nvim',
    version = "*",
    opts = {},
    init = function(_, opts)
      vim.keymap.set("n", "<Leader>w", ":HopWord<CR>", {})

      require("hop").setup(opts)
    end
  }
}
