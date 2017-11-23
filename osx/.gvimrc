
set guioptions=

set macligatures
set guifont=Fira\ Code\ Medium:h10

set hlsearch

" disable bell
autocmd! GUIEnter * set vb t_vb=

" cursor column + line
set number
set cursorline

" AGS 
let g:ags_winheight = '20'

" vim-rspec
let g:rspec_runner = "os_x_iterm2"
let g:rspec_command="reset && zeus test {spec}"

set guifont=Fira_Code_Medium:h10
let g:webdevicons_enable = 1

colorscheme monrovia

" Custom highlighting
"hi VertSplit guifg=#0c1014
"hi Folded guibg=#0c1014
"hi FoldColumn guibg=#11151c
"hi Search guifg=#11151c guibg=#f0e591
"hi Visual guibg=#232a36 guifg=#45afce

let g:lightline = {
      \ 'colorscheme': 'monrovia',
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

augroup reload_gvimrc
  autocmd!
  autocmd bufwritepost $MYGVIMRC nested source $MYGVIMRC
augroup END

