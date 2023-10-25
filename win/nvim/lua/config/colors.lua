vim.cmd([[
  hi Search gui=bold guifg=#c4b341
  hi clear Visual
  hi link Visual Pmenu
]])

-- Fugitive
vim.cmd([[
  hi clear DiffAdd
  hi DiffAdd gui=bold guifg=#709080 guibg=#313b36
  hi clear DiffChange
  hi DiffChange guibg=#332a2f
  hi clear DiffDelete
  hi DiffDelete gui=bold guibg=#4a5466
  hi clear DiffText
  hi DiffText gui=bold guifg=#ecbcbc guibg=#41363c
]])

-- Matchup
vim.cmd([[
  hi clear MatchParen
  hi MatchParen gui=bold guifg=#fdf6e3 guibg=#073642
]])
