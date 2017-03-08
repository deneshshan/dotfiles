set guioptions=

set macligatures
set guifont=Fira\ Code\ Medium:h10

set hlsearch

" disable bell
autocmd! GUIEnter * set vb t_vb=

" cursor column + line
set number
set nocursorcolumn
set nocursorline
set cursorline

" AGS 
let g:ags_winheight = '20'

" vim-rspec
let g:rspec_runner = "os_x_iterm2"
let g:rspec_command="reset && zeus test {spec}"

let g:webdevicons_enable = 0

let g:airline#extensions#tabline#enabled = 1

colorscheme hilal
let g:airline_theme='deep_space'


" Custom highlighting
"hi VertSplit guifg=#0c1014
hi Folded guibg=#0c1014
hi FoldColumn guibg=#11151c
hi Search guibg=#11151c guifg=#f0e591
