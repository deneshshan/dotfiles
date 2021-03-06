
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

" ===================================================
" =  PLUGINS
" ===================================================
call plug#begin('~/.vim/plugged')

"Plugin 'ervandew/supertab'
"Plugin 'thoughtbot/vim-rspec'
"Plugin 'tpope/vim-rails'
"Plugin 'tpope/vim-unimpaired'
"Plugin 'craigemery/vim-autotag'
"Plugin 'mattn/emmet-vim'
"Plugin 'Shutnik/jshint2.vim'
"Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'gabesoft/vim-ags'
"Plugin 'pangloss/vim-javascript'
"Plugin 'tpope/vim-dispatch'
"Plugin 'whatyouhide/vim-gotham'
"Plugin 'tyrannicaltoucan/vim-deep-space'
"Plugin 'scrooloose/syntastic'
"Plugin 'rust-lang/rust.vim'
"Plugin 'chriskempson/base16-vim'
"Plugin 'tpope/vim-repeat'
"Plugin 'svermeulen/vim-easyclip'
"Plugin 'kchmck/vim-coffee-script'
"Plugin 'elixir-lang/vim-elixir'
 
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'jgdavey/tslime.vim'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vimwiki/vimwiki'
Plug 'jlanzarotta/bufexplorer'
Plug 'schickling/vim-bufonly'
Plug 'airblade/vim-gitgutter'
Plug 'sbl/scvim'
Plug 'munshkr/vim-tidal'
Plug 'fatih/vim-go'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'AlessandroYorba/Monrovia'

call plug#end()
filetype plugin indent on

" ===================================================
" =  SUPERTAB
" ===================================================

let g:SuperTabDefaultCompletionType = "<c-n>"

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

let g:hybrid_custom_term_colors = 1
colorscheme hybrid

"colorscheme base16-ocean 
"colorscheme hilal
"colorscheme deep-space
"colorscheme gotham
set number
set rnu

"==================================================
"= WRAPPING
"=o=================================================

function! ToggleWrap()
 if (&wrap == 1)
   set nowrap
 else
   set wrap
 endif
endfunction

set nowrap
nnoremap <leader>w :call ToggleWrap()<CR>

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
nnoremap <leader>h :noh<CR>

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
"nnoremap <c-space>?

" ============== Other shortcuts ====================

" remap insert new line

nmap <S-CR> o<Esc>

let g:sclangTerm = "tmux split-window -h"

imap <F12> <C-w>w
nmap <F12> <Esc><C-w>w
vmap <F12> <Esc><Esc><C-w>w

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

let vimwiki_path='/Users/denesh/vimwiki'
let vimwiki_export_path='/Users/denesh/vimwiki_html'
let wiki_settings={
\ 'template_path': vimwiki_export_path.'vimwiki-assets/',
\ 'template_default': 'default',
\ 'template_ext': '.html',
\ 'auto_export': 0,
\ 'nested_syntaxes': {
\ 'js':'javascript'
\ }}

let wikis=["_personal"]
let g:vimwiki_list = []
for wiki_name in wikis
    let wiki=copy(wiki_settings)
    let wiki.path = vimwiki_path.wiki_name.'/'
    let wiki.path_html = vimwiki_export_path.wiki_name.'/'
    let wiki.diary_index = 'index'
    let wiki.diary_rel_path = 'diary/'
    call add(g:vimwiki_list, wiki)
endfor

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

let g:rspec_command = 'call Send_to_Tmux("reset && zeus test {spec}\n")'
let g:rspec_runner = "os_x_iterm2"

" ===== clipboard options ==

set clipboard=unnamed

" ===== cursor =============

"let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

"==================================================
"=  CTRLP
"==================================================
nnoremap <leader>. :CtrlPTag<cr>


"==================================================
"=  SILVER SEARCHER
"==================================================

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  let g:ags_agcontext = 5
endif

" bind K to grep word under cursor
nnoremap K :Ags <C-R><C-W><CR>

" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ags silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ags<SPACE>

"==================================================
"=  CUSTOM COLOUR SCHEME CHANGES
"==================================================

" GOTHAM
"hi Folded ctermbg=008
"hi FoldColumn ctermbg=008
hi Search ctermbg=016 ctermfg=003

"hi StatusLine ctermbg=008
"hi StatusLineNC ctermbg=008
hi VertSplit ctermbg=236 ctermfg=002
"hi LineNr ctermbg=008

"hi TabLine ctermfg=004 ctermbg=008


"==================================================
"= QARGS
"==================================================

command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

"==================================================
"= TSLIME
"==================================================
"
"
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

"==================================================
"= CONVENIENCE
"==================================================
"
"
nnoremap <leader>jt :%!python<Space>-m<Space>json.tool<CR>

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
"= LOCALLEADER TIDAL
"==================================================
"
let maplocalleader=","
