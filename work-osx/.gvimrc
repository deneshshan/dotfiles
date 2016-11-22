set guioptions=

set macligatures
set guifont=Fira\ Code:h10
"set guifont=Roboto\ Mono\ for\ Powerline:h10
"set linespace=1

set hlsearch

" disable bell
autocmd! GUIEnter * set vb t_vb=

" cursor column + line
"set rnu
set cursorcolumn
set cursorline

" AGS 
let g:ags_winheight = '20'

" vim-rspec
let g:rspec_runner = "os_x_iterm2"
let g:rspec_command="zeus test {spec}"

let g:webdevicons_enable = 0

let g:airline#extensions#tabline#enabled = 1

" Custom highlighting
hi FoldColumn guibg=#11151c
hi Search guibg=#11151c guifg=#f0e591
