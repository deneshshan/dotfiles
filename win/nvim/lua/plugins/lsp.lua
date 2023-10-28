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
			{ 'L3MON4D3/LuaSnip' },
      { 'rasulomaroff/cmp-bufname' },
      { 'hrsh7th/cmp-nvim-lsp-document-symbol' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help' }
		},
		config = function()
			local lsp = require('lsp-zero').preset({})

			lsp.on_attach(function(_, bufnr)
				lsp.default_keymaps({ buffer = bufnr })
			end)

			require('lspconfig').lua_ls.setup({})
			require('lspconfig').rust_analyzer.setup({})

			require('lspconfig').ruby_ls.setup({})
			require('lspconfig').sorbet.setup({})
			require('lspconfig').rubocop.setup({
				cmd = { 'bundle', 'exec', 'rubocop', '--lsp' }
			})

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
          { name = 'nvim_lsp_document_symbol' },
          { name = 'nvim_lsp_signature_help' },
					{
						name = "buffer",
						option = {
							-- Avoid accidentally running on big files
							get_bufnrs = function()
								local buf = vim.api.nvim_get_current_buf()
								local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
								if byte_size > 1024 * 1024 then -- 1 Megabyte max
									return {}
								end
								return { buf }
							end
						}

					}
				}
			})

      vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
		end
	}
}
