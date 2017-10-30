" =============================================================================
" Filename: autoload/lightline/colorscheme/monrovia.vim
" Author: Zoltan Dalmadi
" License: MIT License
" Last Change: 2016/11/2 17:34:27.
" =============================================================================

" Common colors
let s:fg     = '#abb2bf'
let s:blue   = '#61afef'
let s:blue2  = '#1488ad'
let s:blue3  = '#8ad6f9'
let s:blue4  = '#0b6085'
let s:green  = '#1a6a6a'
let s:purple = '#c678dd'
let s:red1   = '#e06c75'
let s:red2   = '#bb3a4e'
let s:yellow = '#e5c07b'

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

if &background ==# 'light'
  " Light variant
  let s:bg     = '#36475c'
  let s:gray1  = '#494b53'
  let s:gray2  = '#f0f0f0'
  let s:gray3  = '#d0d0d0'

  let s:p.normal.left     = [ [ s:bg, s:green, 'bold' ], [ s:gray1, s:gray3 ] ]
  let s:p.normal.middle   = [ [ s:gray1, s:gray2 ] ]
  let s:p.inactive.left   = [ [ s:bg,  s:gray3 ], [ s:bg, s:gray3 ] ]
  let s:p.inactive.middle = [ [ s:gray3, s:gray2 ] ]
  let s:p.inactive.right  = [ [ s:bg, s:gray3 ], [ s:bg, s:gray3 ] ]
  let s:p.insert.left     = [ [ s:bg, s:blue, 'bold' ], [ s:gray1, s:gray3 ] ]
  let s:p.replace.left    = [ [ s:bg, s:red1, 'bold' ], [ s:gray1, s:gray3 ] ]
  let s:p.visual.left     = [ [ s:bg, s:purple, 'bold' ], [ s:gray1, s:gray3 ] ]
else
  " Dark variant
  let s:bg     = '#282c34'
  let s:gray1  = '#5c6370'
  let s:gray2  = '#2c323d'
  let s:gray3  = '#3e4452'

  let s:p.normal.left     = [ [ s:blue3, s:blue2, 'bold' ], [ s:fg, s:gray3 ] ]
  let s:p.normal.middle   = [ [ s:fg, s:gray2 ] ]
  let s:p.inactive.left   = [ [ s:gray1,  s:bg ], [ s:gray1, s:bg ] ]
  let s:p.inactive.middle = [ [ s:gray1, s:gray2 ] ]
  let s:p.inactive.right  = [ [ s:gray1, s:bg ], [ s:gray1, s:bg ] ]
  let s:p.insert.left     = [ [ s:blue3, s:green, 'bold' ], [ s:fg, s:gray3 ] ]
  let s:p.replace.left    = [ [ s:red1, s:red2, 'bold' ], [ s:fg, s:gray3 ] ]
  let s:p.visual.left     = [ [ s:bg, s:purple, 'bold' ], [ s:fg, s:gray3 ] ]
endif

" Common
let s:p.normal.right   = [ [ s:bg, s:blue3, 'bold' ], [ s:bg, s:blue2, 'bold' ] ]
let s:p.normal.error   = [ [ s:red2,   s:bg ] ]
let s:p.normal.warning = [ [ s:yellow, s:bg ] ]
let s:p.insert.right   = [ [ s:blue3, s:green, 'bold' ], [ s:blue3, s:blue2, 'bold' ] ]
let s:p.replace.right  = [ [ s:bg, s:red2, 'bold' ], [ s:bg, s:red1, 'bold' ] ]
let s:p.visual.right   = [ [ s:bg, s:red2, 'bold' ], [ s:bg, s:purple, 'bold' ] ]
let s:p.tabline.left   = [ [ s:bg, s:gray3 ] ]
let s:p.tabline.tabsel = [ [ s:bg, s:purple, 'bold' ] ]
let s:p.tabline.middle = [ [ s:gray3, s:gray2 ] ]
let s:p.tabline.right  = copy(s:p.normal.right)

let g:lightline#colorscheme#monrovia#palette = lightline#colorscheme#fill(s:p)
