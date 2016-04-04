" The following are commented out as they cause vim to behave a lot
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

" =============== Set up vundle ===================
" set the runtime path to include Vundle and initialize
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" ================== PLUGINS  ========================

Plugin 'wincent/command-t'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'thoughtbot/vim-rspec'
Plugin 'jgdavey/tslime.vim'
"Plugin 'elixir-lang/vim-elixir'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
"Plugin 'fatih/vim-go'    
"Plugin 'vim-ruby/vim-ruby'
Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'sbl/scvim'
Plugin 'vimwiki/vimwiki'
Plugin 'burnettk/vim-angular'
"Plugin 'rust-lang/rust.vim'
Plugin 'craigemery/vim-autotag'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'christoomey/vim-system-copy'

call vundle#end()
filetype plugin indent on

" ================== NERDTREE ========================
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 45
let g:NERDTreeMouseMode = 3

" =================== vim ruby ======================
set nocompatible
syntax on
filetype on
filetype indent on
filetype plugin on

set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

set backspace=indent,eol,start

" =============== Set basic settings ================
syntax enable
colorscheme zellner
"colorscheme ron
"colorscheme elflord
"colorscheme slate 
set wrap 
set number

" ==================== Folding ======================
set foldenable
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
nnoremap ,z :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>

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

" Set the text that represents folded lines to a simple dash, showing no
" information.
" This way, when viewing folded specs and classes, there is minimal cruft on
" the screen to distract from the unfolded content.
set foldtext=MyFoldText()
function! MyFoldText()
  return "-"
endfunction

" ============== Custom Colour Schemes ==============

highlight Folded ctermbg=000 ctermfg=007
highlight FoldColumn ctermbg=000 ctermfg=007
highlight Search ctermbg=002
highlight Visual ctermbg=002 ctermbg=004
highlight StatusLine ctermbg=007 ctermfg=000
highlight StatusLineNC ctermbg=000 ctermfg=007
highlight Pmenu ctermbg=000
highlight PmenuSel ctermbg=002 ctermfg=000
highlight Directory guifg=#FF0000 ctermfg=red
hi DiffAdd	ctermbg=4 ctermfg=007
hi DiffChange	ctermbg=002 ctermfg=000
hi DiffDelete	cterm=bold ctermfg=000 ctermbg=6
hi DiffText	cterm=bold ctermbg=1 ctermfg=20

" ================== Long Lines =====================
"

"match ErrorMsg '\%>100v.\+'

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
nnoremap <Space> :
nnoremap <Tab> /

" ============== Other shortcuts ====================

" shift + CR puts end 
imap <C-S>    <CR><CR>end<Esc>-@cc

" remap insert new line

nmap <S-CR> o<Esc>

" scvim shortcuts

"imap  <F2> <Esc><Esc>:SClangStart<CR>
"nmap  <F2> :SClangStart<CR>
"vmap  <F2> <Esc><Esc>:SClangStart<CR>
"imap  <F3> <Esc><Esc>:SClangKill<CR>
"nmap  <F3> :SClangKill<CR>
"vmap  <F3> <Esc><Esc>:SClangKill<CR>
"imap  <F4> <Esc><Esc>:SClangRecompile<CR>
"nmap  <F4> :SClangRecompile<CR>
"vmap  <F4> <Esc><Esc>:SClangRecompile<CR>

let g:sclangTerm = "tmux split-window -h"

imap <F12> <C-w>w
nmap <F12> <Esc><C-w>w
vmap <F12> <Esc><Esc><C-w>w

nmap <left> :tabp<CR>
nmap <right> :tabn<CR>
nmap <up> :cp<CR><Esc><Esc>
nmap <down> :cn<CR><Esc>

nmap <leader>ss <Esc>1G:%s/
nmap <end> <Esc>:grep -r 

" =========== Wiki ==========
"

nmap <leader>st <Esc>?*<CR>lli~~A~~<Esc>

" =========== Ruby ==========

inoremap <leader>f <Esc>^idef<Space><C-o>oend<Esc>
nmap <leader>f ^idef<Space><C-o>oend<Esc>

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

let g:rspec_command = 'call Send_to_Tmux("zeus test --format documentation {spec}\n")'
let g:rspec_runner = "os_x_iterm"

" ======= easier SC run ====

" ===== clipboard options ==

set clipboard=unnamed

" ========= ctrlp ===========
nnoremap <leader>. :CtrlPTag<cr>

nmap <leader>h vip

" =========== whitespace ===========

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
function! TrimWhiteSpace()
    %s/\s\+$//e
  endfunction
  autocmd BufWritePre     *.rb :call TrimWhiteSpace()
