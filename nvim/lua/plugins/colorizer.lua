-- Config adapted from Kien Nguyen-Tuan's neovim config:
-- https://github.com/ntk148v/neovim-config
return { -- colorizer
{
    "norcalli/nvim-colorizer.lua",
    config = function(_)
        require("colorizer").setup()
    end
}}
