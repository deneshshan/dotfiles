" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" =============== Set up pathogen ===================
execute pathogen#infect()

" ================== NERDTREE ========================
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 45

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
"colorscheme zellner
"colorscheme ron
colorscheme elflord
"colorscheme slate 
set nowrap 
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
  let @/='\(describe.*do$\|it.*do$\)'
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

highlight Folded ctermbg=000
highlight Folded ctermfg=007
highlight FoldColumn ctermbg=000
highlight FoldColumn ctermfg=007
highlight Search ctermbg=002
highlight Visual ctermbg=002
highlight Visual ctermbg=004
highlight StatusLine ctermbg=004
highlight StatusLine ctermfg=007
highlight StatusLineNC ctermbg=007
highlight StatusLineNC ctermfg=004

" ================== Long Lines =====================
"

match ErrorMsg '\%>100v.\+'

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ==================== Splits =======================
"
set splitright
set splitbelow

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ==== Easier non-interactive command insertion =====
nnoremap <Space> :

" ============== Other shortcuts ====================

" Set up tabs to work like other editors
nmap <S-Tab> <<
imap <S-Tab> <Esc><<i
vmap <S-Tab> <gv
vmap <Tab> >gv

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

let g:sclangTerm = "open -a iTerm.app"

imap <F12> <C-w>w
nmap <F12> <Esc><C-w>w
vmap <F12> <Esc><Esc><C-w>w

nmap <left> :tabp<CR>
nmap <right> :tabn<CR>
nmap <up> <C-o>
nmap <down> <C-i>

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

let g:rspec_command = '!rspec {spec}'
let g:rspec_runner = "os_x_iterm"
