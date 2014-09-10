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
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" =============== Set up pathogen ===================
execute pathogen#infect()

" =============== NERDTree =========================
map <C-n> :NERDTreeToggle<CR>

" ================== SCVim =========================
let g:sclangTerm        = "urxvtc -e" 
let g:sclangPipeApp     = "~/.vim/bundle/scvim/bin/start_pipe"
let g:sclangDispatcher  = "~/.vim/bundle/scvim/bin/sc_dispatcher" 

" =================== vim ruby ======================
set nocompatible
syntax on
filetype on
filetype indent on
filetype plugin on

set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

" =============== Set basic settings ================

colorscheme elflord 
set wrap 
set number

" ==================== Folding ======================
set foldenable
set foldmethod=marker
highlight Folded ctermbg=006
highlight Folded ctermfg=008

" ==================== Visual  ======================

highlight Visual ctermbg=006
highlight Visual ctermfg=008

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Folds ============================

" set foldmethod=indent "fold based on indent
" set foldnestmax=3 "deepest fold is 3 levels
" set nofoldenable "dont fold by default

" ============== Set ctrl + s to save ===============
noremap <silent> <C-S>  :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

" ==== Easier non-interactive command insertion =====
nnoremap <Space> :

" ============== Other shortcuts ====================

" Set up tabs to work like other editors
nmap <S-Tab> <<
imap <S-Tab> <Esc><<i
vmap <S-Tab> <gv
vmap <Tab> >gv

" bind ctrl + l to hashrocket
imap <C-l> <Space>=><Space>

" convert word into ruby symbol

" add : before word
imap <C-k> <C-o>b:<Esc>Ea
nmap <C-k> lbi:<Esc>E

" add @ before word
imap <C-j> <C-o>b@<Esc>Ea
nmap <C-j> lbi@<Esc>E

" shift + CR puts end 
imap <C-S>    <CR><CR>end<Esc>-@cc

" remap insert new line

nmap <S-CR> o<Esc>

" R-Vim shortcuts

imap <F2> <C-o>:Rmodel<Space>
nmap <F2> :Rmodel<Space>
vmap <F2> <Esc><Esc>:Rmodel<Space>
imap <F3> <C-o>:Rspec<Space>
nmap <F3> :Rspec<Space>
vmap <F3> <Esc><Esc>:Rspec<Space>
imap <F4> <C-o>:Rmigration<Space>
nmap <F4> :Rmigration<Space>
vmap <F4> <Esc><Esc>:Rmigration<Space>
imap <F5> <C-o>:Rcontroller<Space>
nmap <F5> :Rcontroller<Space>
vmap <F5> <Esc><Esc>:Rcontroller<Space>
imap <F6> <C-o>:Rview<Space>
nmap <F6> :Rview<Space>
vmap <F6> <Esc><Esc>:Rview<Space>

imap <F9> <Esc><Esc>:tabedit app/<CR>
nmap <F9> <C-o>:tabedit app/<CR>
vmap <F9> <Esc><Esc>:tabedit app/<CR>

nmap <F10> <C-w>w


nmap <left> :tabp<CR>
nmap <right> :tabn<CR>
nmap <up> <C-o>
nmap <down> <C-i>

nmap <leader>ss <Esc>1G:%s/
nmap <leader>sg <Esc>:grep -r 

" splits
set splitbelow
set splitright

" ruby shortcuts

inoremap <leader>f <C-o>^def<Space><C-o>oend<CR><Esc>kko
inoremap <leader>d <Space>do<CR>end<Esc>ko

" rails

inoremap <leader>m .map(&:)<Esc>i
nmap <leader>m i.map(&:)<Esc>i

inoremap <leader>rq require ''<Esc>i
nmap <leader>rq orequire ''<Esc>i

" specs

inoremap <leader>sc <C-o>o<Esc>k^icontext<Space>'<Esc>$a'<Space>do<CR>end<C-o>^<BS><Esc>ko
nmap <leader>sc o<Esc>k^icontext<Space>'<Esc>$a'<Space>do<CR>end<C-o>^<BS><BS><Space><Esc>ko

inoremap <leader>sd <Esc>^idescribe<Space>'<Esc>$a'<Space>do<CR>end<C-o>^<BS><Esc>ko
nmap <leader>sd o<Esc>k^idescribe<Space>'<Esc>$a'<Space>do<CR>end<C-o>^<BS><BS><Space><Esc>ko

inoremap <leader>si <C-o>o<Esc>k^iit<Space>'<Esc>$a'<Space>do<CR>pending<CR>end<C-o>^<BS><Esc>
nmap <leader>si o<Esc>k^iit<Space>'<Esc>$a'<Space>do<CR>pending<CR>end<C-o>^<BS><BS><Space><Esc>

inoremap <leader>sb before(:each)<Space>do<CR>end<Esc>ko
nmap <leader>sb ibefore(:each)<Space>do<CR>end<Esc>ko

inoremap <leader>sa <C-o>blet(:<Esc>veyA)<Space>{<Space>Fabricate.build(<C-o>p)<Space>}<Esc> 
nmap <leader>sa bilet(:<Esc>veyA)<Space>{<Space>Fabricate.build(<C-o>p)<Space>}<Esc> 

inoremap <leader>fc /' do<CR>a, :focus<Esc>
nmap <leader>fc /' do<CR>a, :focus<Esc>

inoremap <leader>rf /, :focus<CR>veed 
nmap <leader>rf /, :focus<CR>veed 

inoremap <leader>sw /' do<CR>a, :slow<Esc>
nmap <leader>sw /' do<CR>a, :slow<Esc>

inoremap <leader>rs /, :slow<CR>veed 
nmap <leader>rs /, :slow<CR>veed 
" state machine

inoremap <leader>e <C-o>bevent<Space>:<Esc>Ea<Space>do<CR>end<CR><Esc>kkotransition<Space>

" tags in erb
inoremap <leader>t <C-o>^<%<Space><Esc>$a<Space>%><Esc>bh
inoremap <leader>te <C-o>^<%=<Space><Esc>$a<Space>%><Esc>bh
nmap <leader>t ^i<%<Space><Esc>$a<Space>%><Esc>bh
nmap <leader>te ^i<%=<Space><Esc>$a<Space>%><Esc>bh

inoremap <leader>tj <%=<Space>javascript_include_tag<Space>""<Space>%><Esc>hhhha
nmap <leader>tj i<%=<Space>javascript_include_tag<Space>""<Space>%><Esc>hhhha

inoremap <leader>ts <%=<Space>stylesheet_link_tag<Space>""<Space>%><Esc>hhhha
nmap <leader>ts i<%=<Space>stylesheet_link_tag<Space>""<Space>%><Esc>hhhha

inoremap <leader>ti <%=<Space>image_tag<Space>""<Space>%><Esc>hhhha
nmap <leader>ti i<%=<Space>image_tag<Space>""<Space>%><Esc>hhhha
" html tags
inoremap <leader>hc <C-o>b<<Esc>Ea/><Esc>bha<Space>
inoremap <leader>h <C-o>b<<Esc>Ea><Esc>bbveeyeepbi/<Esc>hi
inoremap <leader>hh <C-o>b<<Esc>Ea><Esc>bbveeyeepbi/<Esc>hi<CR><Esc>ko
nmap <leader>hc bi<<Esc>Ea/>
nmap <leader>h bi<<Esc>Ea><Esc>bbveeyeephr/


" project specific
"

inoremap <leader>mi .map(&:id)<Esc>i
nmap <leader>m i.map(&:id)<Esc>i

inoremap <leader>ps .products
inoremap <leader>ap .accounts_products
" inoremap <leader>ca current_account
inoremap <leader>a account
inoremap <leader>bn bundle
inoremap <leader>pr product

