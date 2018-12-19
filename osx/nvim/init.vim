
"The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set wrapscan
set wrap
set linebreak
set breakindent
set smartcase		" Do smart case matching
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

let maplocalleader=','

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

if has("gui_vimr")
  let $PATH="/Users/denesh/.asdf/shims:/Users/denesh/.asdf/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
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
Plug 'matze/vim-move'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'schickling/vim-bufonly'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'skalnik/vim-vroom'
Plug 'qpkorr/vim-bufkill'
Plug 'vimwiki/vimwiki'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'ervandew/supertab'

" ==== OTHER TOOLS
Plug 'easymotion/vim-easymotion'
Plug 'ryanoasis/vim-devicons'
Plug 'ntpeters/vim-better-whitespace'
Plug 'kchmck/vim-coffee-script'
Plug 'majutsushi/tagbar'

" ==== Trying out
Plug 'kien/rainbow_parentheses.vim'
Plug 'jalvesaq/vimcmdline'
Plug 'pbogut/fzf-mru.vim'
Plug 'makerj/vim-pdf'
Plug 'kshenoy/vim-signature'
Plug 'chrisbra/Colorizer'

" ==== ELIXIR
Plug 'slashmili/alchemist.vim'

" ==== RUBY/RAILS
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'thoughtbot/vim-rspec'

" ==== GO
Plug 'fatih/vim-go'
Plug 'jodosha/vim-godebug'

" ==== COLOR SCHEMES
Plug 'whatyouhide/vim-gotham'
Plug 'junegunn/seoul256.vim'
Plug 'kocakosm/hilal'
Plug 'arcticicestudio/nord-vim'
Plug 'kamwitsta/nordisk'
Plug 'jnurmine/Zenburn'
Plug 'acepukas/vim-zenburn'
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'jdkanani/vim-material-theme'

" ==== NEOVIM
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'

call plug#end()
filetype plugin indent on

" ===================================================
" =  CONVENIENCE
" ===================================================

nnoremap <leader>fed :e ~/.config/nvim/init.vim<CR>
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
call deoplete#custom#option('ignore_sources', {
\ '_': ['tag']
\})

" ===================================================
" =  NERDTREE
" ===================================================

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 45
"let g:NERDTreeHighlightCursorline = 0
"let g:NERDTreeLimitedSyntax = 1

" NERDTress File highlighting
"function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 "exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 "exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
"endfunction

"call NERDTreeHighlightFile('ex', 'green', 'none', 'green', '#151515')
"call NERDTreeHighlightFile('exs', 'green', 'none', 'green', '#151515')
"call NERDTreeHighlightFile('rb', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
"call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
"call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
"call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
"call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')

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

set number


  "" ==== nord customisations
  ""
  set termguicolors
  "colorscheme nord
  "hi clear Search
  "hi link Search Float
  "hi clear VertSplit
  "hi link VertSplit LineNr
  "hi clear DiffAdd
  "hi DiffAdd gui=bold guifg=#709080 guibg=#313b36
  "hi clear DiffChange
  "hi DiffChange guibg=#332a2f
  "hi clear DiffDelete
  "hi DiffDelete gui=bold guifg=#4a5466
  "hi clear DiffText
  "hi DiffText gui=bold guifg=#ecbcbc guibg=#41363c
  "hi clear Folded
  "hi link Folded LineNr
  "hi clear agsvFilePath
  "hi link agsvFilePath Float
  "hi clear agsvResultPattern
  "hi link agsvResultPattern Underlined
  "hi clear ExtraWhitespace
  "hi link ExtraWhitespace ErrorMsg

" ==== zenburn
 "colorscheme zenburn
 "hi clear VertSplit
 "hi link VertSplit NonText
 "hi clear LineNr
 "hi link LineNr NonText
 "hi clear agsvFilePath
 "hi link agsvFilePath Float
 "hi clear agsvResultPattern
 "hi link agsvResultPattern Underlined

" ==== gruvbox
let g:gitgutter_override_sign_column_highlight = 1

colorscheme gruvbox
hi clear Search
hi clear Folded
hi clear FoldColumn
hi clear EndOfBuffer
hi clear Visual
hi clear SignColumn
hi clear LineNr
hi clear VertSplit
hi link Search Question
hi link Folded SpecialKey
hi link FoldColumn SpecialKey
hi link EndOfBuffer SpecialKey
hi link LineNr SpecialKey
hi link VertSplit SpecialKey
hi link Visual Pmenu
hi clear DiffAdd
hi DiffAdd gui=bold guifg=#709080 guibg=#313b36
hi clear DiffChange
hi DiffChange guibg=#332a2f
hi clear DiffDelete
hi DiffDelete gui=bold guifg=#4a5466
hi clear DiffText
hi DiffText gui=bold guifg=#ecbcbc guibg=#41363c
hi clear ExtraWhitespace
hi link ExtraWhitespace ErrorMsg
hi clear agsvFilePath
hi link agsvFilePath Float
hi clear agsvResultPattern
hi link agsvResultPattern Underlined

"==================================================
"= CURSOR
"===================================================

set nocursorline
set nocursorcolumn

"augroup CursorLineOnlyInActiveWindow
  "autocmd!
  "autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  "autocmd WinLeave * setlocal nocursorline
"augroup END

"augroup ColorColumnOnlyInActiveWindow
  "autocmd!
  "autocmd VimEnter,WinEnter,BufWinEnter * setlocal colorcolumn=90
  "autocmd WinLeave * setlocal colorcolumn=0
"augroup END
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
let @/='\(describe.*do$\|it.*do$\|context.*do$\|scenario.*do$\)'
setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2
endfunction
map ,zz :call FoldSpec()<CR>

" Fold Ruby, showing class and method definitions
function! FoldDefs()
let @/='\(module\ \|class\ \|has_many\ \|belongs_to\ \|_filter\ \|helper\ \|belongs_to\ \|def\ \|private\|protected\|defp\)'
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
set incsearch

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ==================== Splits =======================
"
set splitright
set splitbelow

" ==================== Tmux =========================
"

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>

" ==================== Col length ====================
"
"set textwidth=90

map <LocalLeader>cc :set colorcolumn=90<CR>
map <LocalLeader>co :set colorcolumn=<CR>

" ==== Easier non-interactive command insertion =====
nnoremap <space> :
nnoremap <tab> /

" ============== Other shortcuts ====================

nmap <left> :tabp<CR>
nmap <right> :tabn<CR>

"===================================================
"=  BUFFERS
"===================================================

nmap <leader>q :bp <BAR> bd #<CR>

" =========== Wiki ==========
"


nmap <leader>st <Esc>?*<CR>lli~~A~~<Esc>

let wiki = {'path': '~/vimwiki/', 'auto_toc': 1}
let wiki.nested_syntaxes = { 'ruby': 'ruby' }
let g:vimwiki_list = [wiki]

" ======= vim-rspec ========
"

map <Leader>c :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
map <LocalLeader>v :VroomRunTestFile<CR>
map <LocalLeader>vv :VroomRunNearestTest<CR>

let g:rspec_command = 'call Send_to_Tmux("reset && spring rspec {spec}\n")'
let g:rspec_runner = "os_x_iterm2"

map <Leader>rp :call Send_to_Tmux("spring rake parallel:spec\n")<CR>

" ===== clipboard options ==

set clipboard=unnamed

" ===== cursor =============

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

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

  let g:ags_winheight = '20'
endif

" bind F to grep word under cursor
nnoremap F :Ags <C-R><C-W><CR>

"==================================================
"= TSLIME
"==================================================
"

vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

"==================================================
"= RELOAD VIMRC
"==================================================
"

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
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
      \ 'active': {
      \   'left': [ [ 'mode', 'readonly' ],
      \             [ 'bufnum', 'gitbranch', 'relativepath', 'modified' ] ]
      \ },
      \ 'component': {
      \   'lineinfo': ' %3l:%-2v',
      \ },
      \ 'component_function': {
		  \   'readonly': 'LightlineReadonly',
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
		  \   'gitbranch': 'LightlineFugitive'
      \ }
      \ }


" let g:lightline.colorscheme = 'nord'
let g:lightline.colorscheme = 'darcula'

function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

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
  "= Move
  "==================================================
  "
  let g:move_key_modifier = 'S'

  "==================================================
  "= VROOM
  "==================================================
  "
  let g:vroom_use_bundle_exec=0
  let g:vroom_use_terminal=1
  let g:vroom_use_spring=1

  "==================================================
  "= ALCHEMIST/ELIXIR
  "==================================================

  let g:alchemist_iex_term_size = 150
  let g:alchemist_iex_term_split = 'vsplit'

  function! ElixirTestFile()
    call Send_to_Tmux("reset && mix test ".expand('%:p')." --trace\n")
  endfunction
  nnoremap <leader>e :call ElixirTestFile()<CR>

  "=================================================a
  "= LSP
  "==================================================
  "
  let g:LanguageClient_autoStop = 0
  let g:LanguageClient_serverCommands = {
      \ 'go': ['go-langserver']
      \ }

set signcolumn=yes

"=================================================a
"= NEOMAKE
"==================================================
"
" When writing a buffer (no delay).
call neomake#configure#automake('w')

let g:neomake_info_sign = {'text': '⦿', 'texthl': 'NeomakeInfoSign'}
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_coffeescript_enabled_makers = ['coffeelint']

"=================================================a
"= NEOSNIPPETS
"==================================================
"
imap <C-s>     <Plug>(neosnippet_expand_or_jump)
smap <C-s>     <Plug>(neosnippet_expand_or_jump)
xmap <C-s>     <Plug>(neosnippet_expand_target)

"=================================================a
"= TAGBAR
"==================================================
"
nmap <F7> :TagbarToggle<CR>

"=================================================a
"= VIM-GO
"==================================================
"
nmap gt :GoToggleBreakpoint<CR>
nmap <leader>gd :GoDebug<CR>

let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 0

"=================================================a
" SHORTCUTS
"==================================================

" ==== FZF
nmap <leader>f :Files<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>t :Tags<CR>

" ==== MRU
nmap <leader>m :FZFMru<CR>

let g:fzf_mru_relative = 1

"=================================================a
" CSCOPE
"==================================================
"
set cscopequickfix=s-,c-,d-,i-,t-,e-,a-

nnoremap <Leader>fc :cscope find c <C-R>=expand("<cword>")<CR><CR>:botright cwindow<CR>
nnoremap <Leader>fs :cscope find s <C-R>=expand("<cword>")<CR><CR>:botright cwindow<CR>

"=================================================a
" LANGCLIENT
"==================================================
"
"let g:LanguageClient_autoStop = 0
"let g:LanguageClient_serverCommands = {
    "\ 'ruby': ['tcp://localhost:7658']
    "\ }

"autocmd FileType ruby setlocal omnifunc=LanguageClient#complete

"nnoremap <silent> <localleader>d :call LanguageClient_textDocument_hover()<CR>
"
let g:NERDTreeLimitedSyntax = 1
