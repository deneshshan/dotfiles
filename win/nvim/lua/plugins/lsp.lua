return {
  {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
      { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
      { 'neovim/nvim-lspconfig' },
      {
        'hrsh7th/cmp-nvim-lsp',
        dependencies = { "hrsh7th/cmp-nvim-lsp", 'hrsh7th/cmp-buffer' }
      },
      { 'hrsh7th/nvim-cmp' },
      { 'rasulomaroff/cmp-bufname' },
    },
    config = function()
      local lsp = require('lsp-zero').preset({})

      lsp.on_attach(function(_, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
      end)

      local lspconfig = require('lspconfig')

      lspconfig.lua_ls.setup({
        on_init = function(client)
          local path = client.workspace_folders[1].name
          if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
            client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
              Lua = {
                runtime = {
                  -- Tell the language server which version of Lua you're using
                  -- (most likely LuaJIT in the case of Neovim)
                  version = 'LuaJIT'
                },
                -- Make the server aware of Neovim runtime files
                workspace = {
                  checkThirdParty = false,
                  library = {
                    vim.env.VIMRUNTIME
                    -- "${3rd}/luv/library"
                    -- "${3rd}/busted/library",
                  }
                  -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                  -- library = vim.api.nvim_get_runtime_file("", true)
                }
              }
            })

            client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
          end
          return true
        end
      })

      -- lspconfig.rust_analyzer.setup({})
      lspconfig.ruby_lsp.setup({})
      lspconfig.sorbet.setup({})
      lspconfig.rubocop.setup({
        cmd = { 'bundle', 'exec', 'rubocop', '--lsp' }
      })
      lspconfig.tsserver.setup({})

      local cmp = require('cmp')
      cmp.setup({
        mapping = {
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
        },

        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        sources = {
          { name = "nvim_lsp" },
          { name = "buffname" },
          {
            name = "buffer",
            option = {
              -- Avoid accidentally running on big files
              get_bufnrs = function()
                -- local buf = vim.api.nvim_get_current_buf()
                -- local buf = vim.api.nvim_list_bufs()
                -- local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
                -- if byte_size > 1024 * 1024 then -- 1 Megabyte max
                --   return {}
                -- end
                -- return { buf }
                return vim.api.nvim_list_bufs()
              end
            }
          }
        }
      })

      vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "gr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>",
        { noremap = true, silent = true })
      -- vim.api.nvim_set_keymap("n", "gr", function() require('telescope.builtin').lsp_references(), { noremap = true, silent = true })
    end
  }
}
