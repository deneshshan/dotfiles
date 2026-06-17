return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    -- Install/maintain parsers for the languages we use. Parsers and their
    -- highlight queries ship together on the (maintained) main branch, so they
    -- stay in lockstep with the Neovim version.
    require("nvim-treesitter").install({
      "ruby", "javascript", "typescript", "python", "json", "yaml",
      "html", "css", "bash", "lua", "markdown", "markdown_inline",
    })

    -- The main branch doesn't auto-enable highlighting; start it per buffer.
    -- pcall keeps it a no-op when a buffer has no parser available.
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end
    })
  end
}
