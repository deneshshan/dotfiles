set guioptions=

set guifont=Ubuntu\ Mono\ derivative\ Powerline:h10
set linespace=1

set hlsearch

" disable bell
autocmd! GUIEnter * set vb t_vb=

" cursor column + line
set rnu
set cursorcolumn
set cursorline

" AGS 
let g:ags_winheight = '20'

" vim-rspec
let g:rspec_runner = "os_x_iterm2"
let g:rspec_command="zeus test {spec}"

let g:webdevicons_enable = 0
