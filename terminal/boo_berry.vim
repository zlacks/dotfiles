" =============================================================================
" Filename: autoload/lightline/colorscheme/boo_berry.vim
" Author: itchyny (edited by Delaney Sander)
" License: MIT License
" Last Change: Thu Aug 31 01:30:16 PM CST 2023
" =============================================================================

let s:base3 = '#C7B8E0'
let s:base23 = '#C7B8E0'
let s:base2 = '#2B1C3D'
let s:base1 = '#C7B8E0'
let s:base0 = '#777777'
let s:base00 = '#2B1C3D'
let s:base01 = '#2B1C3D'
let s:base02 = '#2B1C3D'
let s:base023 = '#333333'
let s:base03 = '#C7B8E0'
let s:red = '#f2777a'
let s:orange = '#f99157'
let s:yellow = '#ffcc66'
let s:green = '#99cc99'
let s:cyan = '#009999'
let s:blue = '#99cccc'
let s:magenta = '#cc99cc'

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:base023, s:blue ], [ s:base3, s:base01 ] ]
let s:p.normal.right = [ [ s:base02, s:base1 ], [ s:base2, s:base01 ] ]
let s:p.inactive.right = [ [ s:base02, s:base0 ], [ s:base1, s:base01 ] ]
let s:p.inactive.left =  [ [ s:base02, s:base0 ], [ s:base00, s:base03 ] ]
let s:p.insert.left = [ [ s:base023, s:green ], [ s:base3, s:base01 ] ]
let s:p.replace.left = [ [ s:base023, s:orange ], [ s:base3, s:base01 ] ]
let s:p.visual.left = [ [ s:base023, s:magenta ], [ s:base3, s:base01 ] ]
let s:p.normal.middle = [ [ s:base1, s:base02 ] ]
let s:p.inactive.middle = [ [ s:base0, s:base02 ] ]
let s:p.tabline.left = [ [ s:base1, s:base01 ] ]
let s:p.tabline.tabsel = [ [ s:base2, s:base03 ] ]
let s:p.tabline.middle = copy(s:p.tabline.left)
let s:p.tabline.right = copy(s:p.normal.right)
let s:p.normal.error = [ [ s:base023, s:red ] ]
let s:p.normal.warning = [ [ s:base023, s:yellow ] ]

let g:lightline#colorscheme#boo_berry#palette = lightline#colorscheme#fill(s:p)
