--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: plugins/treesitter.lua
-- Description: nvim-treesitter configuration
-- Author: Kien Nguyen-Tuan <kiennt2609@gmail.com>
return { -- Treesitter interface
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    opts = {
      ensure_installed = { "go", "dockerfile", "json", "yaml", "markdown", "html", "scss", "css", "vim",
        "ruby", "lua", "haskell" },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    },
    config = function(_, opts)
      require("nvim-treesitter").setup(opts)

      -- Treesitter folding.
      -- Mappings:
      --   za  toggle fold under cursor
      --   zc  close fold under cursor
      --   zo  open fold under cursor
      --   zM  close all folds
      --   zR  open all folds
      vim.opt.foldlevel = 99
      vim.opt.foldenable = false

      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          pcall(vim.treesitter.start)
          if vim.treesitter.get_parser(0, nil, { error = false }) then
            vim.wo.foldmethod = "expr"
            vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          end
        end,
      })

      -- <leader>fm: fold Ruby methods and ActiveRecord scopes.
      -- Detects the foldlevel of the shallowest method/scope body line and
      -- sets `foldlevel` to one below it, so methods/scopes close while
      -- their enclosing module/class stay open. `zR` undoes.
      vim.keymap.set("n", "<leader>fm", function()
        if vim.bo.filetype ~= "ruby" then return end

        local parser = vim.treesitter.get_parser(0)
        if not parser then return end

        vim.wo.foldenable = true
        vim.cmd("normal! zR")

        local query = vim.treesitter.query.parse("ruby", [[
          (method)           @fold
          (singleton_method) @fold
          (call
            method: (identifier) @_scope_name
            (#eq? @_scope_name "scope")) @fold
        ]])

        local min_level
        for id, node in query:iter_captures(parser:parse()[1]:root(), 0) do
          if query.captures[id] == "fold" then
            local sr, _, er = node:range()
            if er > sr then
              local lvl = vim.fn.foldlevel(sr + 2)
              if lvl > 0 and (min_level == nil or lvl < min_level) then
                min_level = lvl
              end
            end
          end
        end

        if min_level then
          vim.wo.foldlevel = min_level - 1
        end
      end, { desc = "Fold methods + scopes (Ruby)" })
    end,
  }
}
