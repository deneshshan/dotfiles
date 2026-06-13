-- Based on: https://github.com/ntk148v/neovim-config
return { -- Statusline
	-- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
	{
		"nvim-lualine/lualine.nvim",
		config = function(_)
			local lualine = require("lualine")

			-- Now don"t forget to initialize lualine
			lualine.setup({})
		end
	} }
