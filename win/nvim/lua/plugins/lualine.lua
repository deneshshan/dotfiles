--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: plugins/lualine.lua
-- Description: Pacman config for lualine
-- Author: Kien Nguyen-Tuan <kiennt2609@gmail.com>
-- Credit: shadmansaleh & his evil theme: https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/evil_lualine.lua
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
