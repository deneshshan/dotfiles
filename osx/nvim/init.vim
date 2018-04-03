
"The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" ===================================================
" =  VUNDLE SETUP
" ===================================================

" set the runtime path to include Vundle and initialize
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call plug#begin('~/.config/nvim/plugged')


" ===================================================
" =  PLUGINS
" ===================================================

" ==== ESSENTIAL TOOLS
Plug 'christoomey/vim-tmux-navigator'
Plug 'gabesoft/vim-ags'
Plug 'jgdavey/tslime.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'vimwiki/vimwiki'
Plug 'matze/vim-move'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'schickling/vim-bufonly'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'

" ==== OTHER TOOLS
Plug 'ervandew/supertab'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/calendar.vim'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'ryanoasis/vim-devicons'

" ==== RUBY
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'thoughtbot/vim-rspec'

" ==== COLOR SCHEMES
Plug 'dwkmatt/Monrovia'
Plug 'whatyouhide/vim-gotham'
Plug 'chriskempson/base16-vim'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'kocakosm/hilal'
Plug 'arcticicestudio/nord-vim'
Plug 'kamwitsta/nordisk'
Plug 'tomasr/molokai'

" ==== NEOVIM
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf'
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'


call plug#end()
filetype plugin indent on

" ===================================================
" =  CONVENIENCE
" ===================================================

nnoremap <C-T> :tabe %<CR>
nnoremap <leader>jt :%!python<Space>-m<Space>json.tool<CR>

" ===================================================
" =  SUPERTAB
" ===================================================

let g:SuperTabDefaultCompletionType = "<c-n>"

" ===================================================
" =  DEOPLETE
" ===================================================

let g:deoplete#enable_at_startup = 1

" ===================================================
" =  NERDTREE
" ===================================================

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 45

" ===================================================
" =  VIM RUBY
" ===================================================

set nocompatible
syntax on
filetype on
filetype indent on
filetype plugin on

set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

set backspace=indent,eol,start

" ===================================================
" =  BASIC SETTINGS
" ===================================================

syntax enable
set background=dark

"==================================================
"= COLOUR SCHEME
"==================================================

"set termguicolors

"colorscheme base16-ocean
"colorscheme hilal
colorscheme nord
"colorscheme deep-space
"colorscheme alchemie
"colorscheme gotham
set number
"set rnu

hi LineNr guibg=000 guifg=001
if has("gui_vimr") 
  hi clear Search
  hi clear IncSearch
  hi Search guifg=#BF616A gui=underline
  hi link IncSearch Search
  hi clear LineNr
  hi link LineNr Boolean
else
  "hi Search ctermfg=000 ctermbg=001 
  hi clear Visual
  hi clear Search
  hi clear String
  hi link Search IncSearch
  hi link Visual StatusLine
  hi link String GitGutterChangeDefault
  hi IncSearch ctermbg=000 ctermfg=005
endif

"==================================================
"= WRAPPING
"===================================================

function! ToggleWrap()
if (&wrap == 1)
 set nowrap
else
 set wrap
endif
endfunction

set nowrap
nnoremap <leader>w :call ToggleWrap()<CR>

"==================================================
"= CURSOR
"===================================================

set nocursorline
set nocursorcolumn

" ===================================================
" =  FOLDING
" ===================================================

"set foldenable
"set foldmethod=exprt
"set foldlevel=1
"set foldnestmax=2

" Folding for Ruby
"
" ,z  -- Show only last search
" ,zz -- Show only "describe ..." and "it ..." lines in specs
" ,zd -- Show only "class ..." and "def ..." lines in Ruby files
" zR  -- Remove all folds
"
" From http://vim.wikia.com/wiki/Folding_with_Regular_Expression
"nnoremap ,z :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>

" Then variations on that, with different searches ...
"
" Fold spec files, displaying "describe ..." and "it ..." lines
function! FoldSpec()
let @/='\(describe.*do$\|it.*do$\|context.*do$\)'
setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2
endfunction
map ,zz :call FoldSpec()<CR>

" Fold Ruby, showing class and method definitions
function! FoldDefs()
let @/='\(module\ \|class\ \|has_many\ \|belongs_to\ \|_filter\ \|helper\ \|belongs_to\ \|def\ \|private\|protected\)'
setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2
endfunction
map ,zd :call FoldDefs()<CR>
" Fold Cucumber
function! FoldCucumber()
let @/='\(Given\ \|When\ \)'
setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2
endfunction
map ,zs :call FoldCucumber()<CR>

" Set the text that represents folded lines to a simple dash, showing no
" information.
" This way, when viewing folded specs and classes, there is minimal cruft on
" the screen to distract from the unfolded content.
set foldtext=MyFoldText()
function! MyFoldText()
return "-"
endfunction

" ===================================================
" =  SEARCH
" ===================================================

set hlsearch
nnoremap <CR> :noh<CR>

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ==================== Splits =======================
"
set splitright
set splitbelow

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>

" ==== Easier non-interactive command insertion =====
nnoremap <space> :
nnoremap <tab> /

" ============== Other shortcuts ====================

nmap <left> :tabp<CR>
nmap <right> :tabn<CR>

"===================================================
"=  BUFFERS
"===================================================

nmap <up> :bp<CR><Esc><Esc>
nmap <down> :bn<CR><Esc>
nmap <leader>q :bp <BAR> bd #<CR>

" =========== Wiki ==========
"

nmap <leader>st <Esc>?*<CR>lli~~A~~<Esc>

let wiki = {'path': '~/vimwiki/', 'auto_toc': 1}
let wiki.nested_syntaxes = { 'ruby': 'ruby' }
let g:vimwiki_list = [wiki]

" ========== Specs ==========

inoremap <leader>sc <Esc>^icontext<Space>'#<Space><C-o>A'<Space>do<C-o>oend<Esc>
nmap <leader>sc ^icontext<Space>'#<Space><C-o>A'<Space>do<C-o>oend<Esc>

inoremap <leader>sd <Esc>^idescribe<Space>'<Esc>A'<Space>do<C-o>oend<Esc>
nmap <leader>sd ^idescribe<Space>'<Esc>A'<Space>do<C-o>oend<Esc>

inoremap <leader>si <Esc>^iit '<C-o>A'<Esc>
nmap <leader>si ^iit '<C-o>A'<Esc>

inoremap <leader>sb before(:each)<Space>do<CR>end<Esc>ko
nmap <leader>sb ibefore(:each)<Space>do<CR>end<Esc>ko

" ======= vim-rspec ========
"

map <Leader>c :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
 
let g:rspec_command = 'call Send_to_Tmux("spring rspec {spec}\n")'
let g:rspec_runner = "os_x_iterm2"

map <Leader>rp :call Send_to_Tmux("spring rake parallel:spec\n")<CR>

" ===== clipboard options ==

set clipboard=unnamed

" ===== cursor =============

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

"==================================================
"=  CTRLP
"==================================================
nnoremap <leader>. :CtrlPTag<cr>

let g:ctrlp_cmd='CtrlPBuffer'

"==================================================
"=  SILVER SEARCHER
"==================================================

if executable('ag')
" Use ag over grep
set grepprg=ag\ --nogroup

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l -g ""'

" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

let g:ags_agcontext = 5
endif

" bind K to grep word under cursor
nnoremap F :Ags <C-R><C-W><CR>

"==================================================
"= TSLIME
"==================================================
"
"
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

"==================================================
"= AGS
"==================================================
"
let g:ags_winheight = '20'

augroup reload_vimrc
autocmd!
autocmd bufwritepost $MYVIMRC nested source $MYVIMRC
augroup END

"==================================================
"= LIGHTLINE
"==================================================
"
" Monrovia == monrovia, mg
" Hilal == molokai
"
"16color                 Tomorrow_Night          jellybeans              seashells_edit
"Dracula                 Tomorrow_Night_Blue     landscape               seoul256
"PaperColor              Tomorrow_Night_Bright   molokai                 solarized
"PaperColor_dark         Tomorrow_Night_Eighties monrovia                wombat
"PaperColor_light        darcula                 one
"Tomorrow                default                 powerline
"
let g:lightline = {
        \ 'separator': { 'left': '', 'right': '' },
        \ 'subseparator': { 'left': '', 'right': '' },
        \ 'component_function': {
        \   'filetype': 'MyFiletype',
        \   'fileformat': 'MyFileformat',
        \   'gitbranch': 'fugitive#head'
        \ },
        \ 'active': {
        \   'left': [ [ 'mode' ],
        \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
        \ }
        \ }

if has("gui_vimr")
  let g:lightline.colorscheme = 'monrovia'
else
  let g:lightline.colorscheme = 'mg'
endif

  function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
  endfunction

  function! MyFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
  endfunction

  function! s:set_lightline_colorscheme(name) abort
    let g:lightline.colorscheme = a:name
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
  endfunction

  function! s:lightline_colorschemes(...) abort
    return join(map(
          \ globpath(&rtp,"autoload/lightline/colorscheme/*.vim",1,1),
          \ "fnamemodify(v:val,':t:r')"),
          \ "\n")
  endfunction

  command! -nargs=1 -complete=custom,s:lightline_colorschemes LightlineColorscheme
        \ call s:set_lightline_colorscheme(<q-args>)

"==================================================
"= NERDTREE tabs
"==================================================
"
map <Leader>n <plug>NERDTreeTabsToggle<CR>

"==================================================
"= Move
"==================================================
"
let g:move_key_modifier = 'S'

"==================================================
"= SYNTASTIC
"==================================================
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
