set encoding=utf-8
set guioptions=


set hlsearch

" disable bell
autocmd! GUIEnter * set vb t_vb=

" cursor column + line
set number
set cursorline
set cursorcolumn

" AGS
let g:ags_winheight = '20'

" vim-rspec
let g:rspec_runner = "os_x_iterm2"
let g:rspec_command="reset && zeus test {spec}"

set macligatures
set guifont=Fira_Code_Medium:h10
let g:webdevicons_enable = 0

colorscheme monrovia

" Custom highlighting
hi VertSplit guifg=#242424 guibg=#242424
"hi Folded guibg=#0c1014
"hi FoldColumn guibg=#11151c
"hi Search guifg=#11151c guibg=#f0e591
"hi Visual guibg=#232a36 guifg=#45afce

" Airline
let g:airline_theme='wombat'
let g:airline_powerline_fonts = 0
let g:airline_left_sep='>>'
let g:airline_right_sep='<<'


augroup reload_gvimrc
  autocmd!
  autocmd bufwritepost $MYGVIMRC nested source $MYGVIMRC
augroup END

