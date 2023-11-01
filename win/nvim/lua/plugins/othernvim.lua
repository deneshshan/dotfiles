return {
	{
		"rgroli/other.nvim",
		opts = {
			mappings = { "rails" }
		},
		config = function(_, opts)
			require("other-nvim").setup(opts)
		end
	}
}
