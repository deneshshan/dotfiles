set guioptions=

"set guifont=Ubuntu\ Mono\ derivative\ Powerline:h11
"set guifont=UbuntuMono\ Nerd\ Font:h11
set guifont=DejaVuSansMonoForPowerline\ Nerd\ Font:h10
set linespace=1

"colorscheme gotham
set background=dark

colorscheme hilal
"colorscheme spacedust
let g:airline_theme='deep_space'
"let g:airline_theme='tomorrow'
"let g:airline_theme='base16'
"hi Search guifg=#4f5b66 guibg=#BBFFFF
"hi LineNr guifg=#62afae guibg=#12303f
set hlsearch

"set relativenumber
set wrap

" disable bell
autocmd! GUIEnter * set vb t_vb=

" cursor column + line
set cursorcolumn
set cursorline

" AGS 
let g:ags_winheight = '20'

let g:airline_powerline_fonts=1

" vim-rspec
"let g:rspec_command="zeus test {spec}"
"let g:rspec_runner=''

let g:webdevicons_enable = 0
