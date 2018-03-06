"   _____ ______   ________  ________   ________  ________  ___      ___ ___  ________
"  |\   _ \  _   \|\   __  \|\   ___  \|\   __  \|\   __  \|\  \    /  /|\  \|\   __  \
"  \ \  \\\__\ \  \ \  \|\  \ \  \\ \  \ \  \|\  \ \  \|\  \ \  \  /  / | \  \ \  \|\  \
"   \ \  \\|__| \  \ \  \\\  \ \  \\ \  \ \   _  _\ \  \\\  \ \  \/  / / \ \  \ \   __  \
"    \ \  \    \ \  \ \  \\\  \ \  \\ \  \ \  \\  \\ \  \\\  \ \    / /   \ \  \ \  \ \  \
"     \ \__\    \ \__\ \_______\ \__\\ \__\ \__\\ _\\ \_______\ \__/ /     \ \__\ \__\ \__\
"      \|__|     \|__|\|_______|\|__| \|__|\|__|\|__|\|_______|\|__|/       \|__|\|__|\|__|


" A Vim colorscheme
" Author:       Alessandro Yorba
" Script URL:   https://github.com/AlessandroYorba/Monrovia
" License:      MIT


" Copyright (c) 2017 Alessandro Yorba
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.

"=================================================================================
" MONROVIA TERMINAL:
"=================================================================================
"     Foreground    #c6c4bd             |      Selection     #538798             |
"     Background    #1e2834             |      Selected Text #1e2834             |
"     Bold          #ffffff             |                                        |
"     Links         #bd384c             |                                        |
"     CursorColor   #FFFFFF             |                                        |
"     CursorText    #1f2433             |                                        |
"=================================================================================
" ANSI COLORS:                                                                   |
"=================================================================================
"---------------------------------------|-----------------------------------------
"     NORMAL        Hex          xterm  |      BRIGHT        Hex          xterm  |
"---------------------------------------|-----------------------------------------
"     Black         #1e2834      0      |      brBlack       #35475d      8      |
"     Red           #bd384c      1      |      brRed         #bd384c      9      |
"     Green         #a28e8f      2      |      brGreen       #a28e8f      10     |
"     Yellow        #146a6b      3      |      brYellow      #146a6b      11     |
"     Blue          #006686      4      |      brBlue        #006686      12     |
"     Magenta       #864451      5      |      brMagenta     #864451      13     |
"     Cyan          #538798      6      |      brCyan        #538798      14     |
"     White         #c6c4bd      7      |      brWhite       #96a2b0      15     |
"---------------------------------------|-----------------------------------------
"=================================================================================

"=================================================================================
" SETUP:
"=================================================================================

set background=dark

highlight clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name="monrovia"


"=======================================================================================================================
" MONROVIA HIGHLIGHTING:
"=======================================================================================================================
highlight! CursorLine               guifg=NONE     guibg=#24303E  gui=NONE       ctermfg=NONE  ctermbg=0     cterm=NONE
highlight! CursorColumn             guifg=NONE     guibg=#24303E  gui=NONE       ctermfg=NONE  ctermbg=0     cterm=NONE
highlight! Normal                   guifg=#c6c4bd  guibg=#1e2834  gui=NONE       ctermfg=7     ctermbg=0     cterm=NONE
highlight! Visual                   guifg=#96a2b0  guibg=NONE     gui=reverse    ctermfg=15    ctermbg=NONE  cterm=reverse
highlight! PmenuSbar                guifg=#35475d  guibg=#35475d  gui=NONE       ctermfg=8     ctermbg=8     cterm=NONE
highlight! Comment                  guifg=#35475d  guibg=NONE     gui=NONE       ctermfg=8     ctermbg=NONE  cterm=NONE
highlight! Operator                 guifg=#96a2b0  guibg=NONE     gui=NONE       ctermfg=15    ctermbg=NONE  cterm=NONE
highlight! Boolean                  guifg=#864451  guibg=NONE     gui=NONE       ctermfg=5     ctermbg=NONE  cterm=NONE
highlight! SpecialComment           guifg=#35475d  guibg=NONE     gui=reverse    ctermfg=8     ctermbg=NONE  cterm=reverse
highlight! Function                 guifg=#006686  guibg=NONE     gui=NONE       ctermfg=4     ctermbg=NONE  cterm=NONE
highlight! Error                    guifg=#bd384c  guibg=NONE     gui=reverse    ctermfg=1     ctermbg=NONE  cterm=reverse
highlight! SpellBad                 guifg=#bd384c  guibg=NONE     gui=undercurl  ctermfg=1     ctermbg=NONE  cterm=undercurl
highlight! SpellLocal               guifg=#a28e8f  guibg=NONE     gui=undercurl  ctermfg=2     ctermbg=NONE  cterm=undercurl
highlight! SpellCap                 guifg=#146a6b  guibg=NONE     gui=undercurl  ctermfg=3     ctermbg=NONE  cterm=undercurl
highlight! PreProc                  guifg=#146a6b  guibg=NONE     gui=NONE       ctermfg=3     ctermbg=NONE  cterm=NONE
highlight! Constant                 guifg=#a28e8f  guibg=NONE     gui=NONE       ctermfg=2     ctermbg=NONE  cterm=NONE
highlight! Statement                guifg=#a28e8f  guibg=NONE     gui=NONE       ctermfg=2     ctermbg=NONE  cterm=NONE
highlight! String                   guifg=#538798  guibg=NONE     gui=NONE       ctermfg=6     ctermbg=NONE  cterm=NONE
highlight! Search                   guifg=#538798  guibg=NONE     gui=reverse    ctermfg=6     ctermbg=NONE  cterm=reverse
highlight! DiffAdd                  guifg=#c6c4bd  guibg=NONE     gui=reverse    ctermfg=7     ctermbg=NONE  cterm=reverse
highlight! DiffChange               guifg=#a28e8f  guibg=NONE     gui=reverse    ctermfg=2     ctermbg=NONE  cterm=reverse
highlight! Todo                     guifg=#006686  guibg=NONE     gui=reverse    ctermfg=2     ctermbg=NONE  cterm=reverse
highlight! LineNr                   guifg=#35475d  guibg=NONE     gui=NONE       ctermfg=8     ctermbg=NONE  cterm=NONE
highlight! TabLine                  guifg=NONE     guibg=NONE     gui=NONE       ctermfg=NONE  ctermbg=NONE  cterm=NONE
highlight! TabLineSel               guifg=#1e2834  guibg=#146a6b  gui=NONE       ctermfg=0     ctermbg=3     cterm=NONE
highlight! TabLineFill              guifg=#35475d  guibg=NONE     gui=underline  ctermfg=8     ctermbg=NONE  cterm=underline
highlight! StatusLine               guifg=#c6c4bd  guibg=#35475d  gui=NONE       ctermfg=7     ctermbg=8     cterm=NONE
highlight! StatusLineNC             guifg=#1e2834  guibg=#35475d  gui=NONE       ctermfg=0     ctermbg=8     cterm=NONE
highlight! VertSplit                guifg=#35475d  guibg=NONE     gui=NONE       ctermfg=8     ctermbg=0     cterm=NONE

highlight! link DiffDelete          Error
highlight! link ErrorMsg            Error
highlight! link WildMenu            Visual
highlight! link ModeMsg             Visual
highlight! link StorageClass        Normal
highlight! link htmlItalic          Normal
highlight! link SignColumn          String
highlight! link MoreMsg             String
highlight! link markdownLinkText    String
highlight! link WarningMsg          String
highlight! link Number              PreProc
highlight! link htmlTag             PreProc
highlight! link htmlEndTag          PreProc
highlight! link htmlStatement       PreProc
highlight! link Type                PreProc
highlight! link Title               PreProc
highlight! link FoldColumn          PreProc
highlight! link phpVarSelector      PreProc
highlight! link Directory           PreProc
highlight! link Special             Operator
highlight! link SpecialKey          Operator
highlight! link Identifier          Function
highlight! link Underlined          Special
highlight! link Question            Special
highlight! link PmenuSel            StatusLine
highlight! link Pmenu               StatusLineNC
highlight! link TabLine             StatusLineNC
highlight! link VimCommentTitle     SpecialComment
highlight! link Folded              LineNr
highlight! link NonText             Comment
highlight! link DiffText            DiffAdd
highlight! link PmenuThumb          PmenuSbar
highlight! link ColorColumn         CursorLine
highlight! link CursorLineNr        TabLineSel
highlight! link MatchParen          TabLineSel
highlight! link SpellRare           SpellLocal
highlight! link htmlSpecialTagName  PreProc

