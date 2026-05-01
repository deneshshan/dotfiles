return {
  {
    "andymass/vim-matchup",
    config = function()
      vim.cmd([[
        hi clear MatchParen
        hi MatchParen gui=bold guifg=#fdf6e3 guibg=#073642
      ]])
    end
  }
}
