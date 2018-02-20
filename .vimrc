set nocompatible

"History
set history=1000
set undolevels=1000

"Tab
set backspace=indent,eol,start
set autoindent
set copyindent
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'

"Search
set ignorecase
set incsearch
set hlsearch
set smartcase     " ignore case if search pattern is all lowercase,

"folding
"set foldmethod=syntax
"set foldlevelstart=1

"wild menu
set wildmenu
set wildmode=list:longest,full

"Mouse
set mouse=a
set ttymouse=sgr

noremap  <f3> :set nonumber mouse=<return>
inoremap <f3> <c-o>:set nonumber mouse=<return>

noremap  <f2> :set number mouse=a<return>
inoremap <f2> <c-o>:set number mouse=a<return>

"Status line
set ls=2
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'}]  " filetype
"set statusline+=[%{WhatFunction()}]
"set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
"set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset


execute pathogen#infect()


syntax enable
set nowrap
set number
set colorcolumn=80

"Syntax color for other files

au BufRead,BufNewFile *.tdl set filetype=c
au BufRead,BufNewFile *.cdl set filetype=c
au BufRead,BufNewFile *.tpp set filetype=c
au BufRead,BufNewFile *.ptl set filetype=c

syn keyword type table_def enum_def type_def module_def

"Nerd Tree
map <C-d> :NERDTreeToggle<CR>
"let g:NERDTreeDirArrows=0
"NERDTree automatically when vim starts up
"autocmd vimenter * NERDTree
"open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
" source files
call NERDTreeHighlightFile('.c', '11', 'NONE', 'NONE', 'NONE')
call NERDTreeHighlightFile('cpp', '11', 'NONE', 'NONE', 'NONE')
call NERDTreeHighlightFile('h', '3', 'NONE', 'NONE', 'NONE')
call NERDTreeHighlightFile('cc', '5', 'NONE', 'NONE', 'NONE')
call NERDTreeHighlightFile('mm', '4', 'NONE', 'NONE', 'NONE')
" shell scripts
call NERDTreeHighlightFile('sh', '2', 'NONE', 'NONE', 'NONE')
call NERDTreeHighlightFile('py', '2', 'NONE', 'NONE', 'NONE')
call NERDTreeHighlightFile('lua', '2', 'NONE', 'NONE', 'NONE')
call NERDTreeHighlightFile('bash', '2', 'NONE', 'NONE', 'NONE')
call NERDTreeHighlightFile('zsh', '2', 'NONE', 'NONE', 'NONE')
" makefiles
call NERDTreeHighlightFile('mk', '13', 'NONE', 'NONE', 'NONE')
call NERDTreeHighlightFile('makefile', '13', 'NONE', 'NONE', 'NONE')
call NERDTreeHighlightFile('Makefile', '13', 'NONE', 'NONE', 'NONE')
call NERDTreeHighlightFile('configure', '13', 'NONE', 'NONE', 'NONE')

scriptencoding utf-8
set encoding=utf-8

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

"Indent line
let g:indentLine_color_term = 239
let g:indentLine_char = ':'

"indent guide
"hi IndentGuidesOdd  ctermbg=black
"hi IndentGuidesEven ctermbg=darkgrey

"color
set t_Co=256
"colorscheme 1989 "48 48 48
" Vim color file 1989

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "1989"

let s:dark_gray = [236, "#303030"]
let s:light_gray = [240, "#888888"]
let s:mid_gray = [102, "#878787"]
let s:default_white = [231, "#FFFFFF"]

let s:lavender = [183, "#dfafff"]
let s:light_purple = [225, "#ffdfff"]
let s:gray_purple = [146, "#afafd7"]

let s:pink = [218, "#ffafdf"]
let s:light_blue = [159, "#afffff"]
let s:mint = [158, "#afffd7"]
let s:light_yellow = [229, "#ffffaf"]

let s:dark_pink = [197, "#ff005f"]
let s:dark_green = [29, "#00875f"]
let s:dark_blue = [31, "#0087af"]

let s:none = ["NONE", ""]

function! <SID>set_hi(name, fg, bg, style)
  execute "hi " . a:name . " ctermfg=" . a:fg[0] . " ctermbg=" . a:bg[0] " cterm=" . a:style
  if a:fg[1] != ""
    execute "hi " . a:name . " guifg=" . a:fg[1]
  endif
  if a:bg[1] != ""
    execute "hi " . a:name . " guibg=" . a:bg[1]
  endif
  execute "hi " . a:name . " gui=" . a:style
endfun

call <SID>set_hi("Normal", s:default_white, s:dark_gray, "NONE")
call <SID>set_hi("Cursor", s:dark_gray, s:default_white, "NONE")
call <SID>set_hi("Visual", s:none, s:mid_gray, "NONE")
call <SID>set_hi("CursorLine", s:none, s:dark_gray, "NONE")
call <SID>set_hi("CursorColumn", s:none, s:dark_gray, "NONE")
call <SID>set_hi("ColorColumn", s:none, s:dark_gray, "NONE")
call <SID>set_hi("LineNr", s:mid_gray, s:dark_gray, "NONE")
call <SID>set_hi("VertSplit", s:mid_gray, s:mid_gray, "NONE")
call <SID>set_hi("MatchParen", s:pink, s:none, "underline")
call <SID>set_hi("StatusLine", s:default_white, s:mid_gray, "NONE")
call <SID>set_hi("StatusLineNC", s:default_white, s:light_gray, "NONE")
call <SID>set_hi("Pmenu", s:none, s:none, "NONE")
call <SID>set_hi("PmenuSel", s:none, s:dark_gray, "NONE")
call <SID>set_hi("IncSearch", s:default_white, s:light_yellow, "inverse")
call <SID>set_hi("Search", s:default_white, s:light_yellow, "inverse")
"call <SID>set_hi("Search", s:none, s:none, "underline")
call <SID>set_hi("Directory", s:lavender, s:none, "NONE")
call <SID>set_hi("Folded", s:light_yellow, s:dark_gray, "NONE")

call <SID>set_hi("Define", s:gray_purple, s:none, "NONE")
call <SID>set_hi("DiffAdd", s:default_white, s:dark_green, "NONE")
call <SID>set_hi("DiffDelete", s:dark_pink, s:none, "NONE")
call <SID>set_hi("DiffChange", s:default_white, s:dark_gray, "NONE")
call <SID>set_hi("DiffText", s:default_white, s:dark_blue, "NONE")
call <SID>set_hi("ErrorMsg", s:default_white, s:dark_pink, "NONE")
call <SID>set_hi("WarningMsg", s:default_white, s:dark_pink, "NONE")

call <SID>set_hi("Boolean", s:lavender, s:none, "NONE")
call <SID>set_hi("Character", s:lavender, s:none, "NONE")
call <SID>set_hi("Comment", s:gray_purple, s:none, "NONE")
call <SID>set_hi("Conditional", s:pink, s:none, "NONE")
call <SID>set_hi("Constant", s:mint, s:none, "NONE")
call <SID>set_hi("Float", s:lavender, s:none, "NONE")
call <SID>set_hi("Function", s:light_purple, s:none, "NONE")
call <SID>set_hi("Identifier", s:light_purple, s:none, "NONE")
call <SID>set_hi("Keyword", s:pink, s:none, "NONE")
call <SID>set_hi("Label", s:light_yellow, s:none, "NONE")
call <SID>set_hi("NonText", s:default_white, s:dark_gray, "NONE")
call <SID>set_hi("Number", s:mint, s:none, "NONE")
call <SID>set_hi("Operator", s:pink, s:none, "NONE")
call <SID>set_hi("PreProc", s:pink, s:none, "NONE")
call <SID>set_hi("Special", s:light_purple, s:none, "NONE")
call <SID>set_hi("SpecialKey", s:default_white, s:dark_gray, "NONE")
call <SID>set_hi("Statement", s:pink, s:none, "NONE")
call <SID>set_hi("StorageClass", s:mint, s:none, "NONE")
call <SID>set_hi("String", s:light_blue, s:none, "NONE")
call <SID>set_hi("Tag", s:pink, s:none, "NONE")
call <SID>set_hi("Title", s:default_white, s:none, "NONE")
call <SID>set_hi("Todo", s:light_yellow, s:none, "inverse")
call <SID>set_hi("Type", s:mint, s:none, "NONE")
call <SID>set_hi("Underlined", s:none, s:none, "underline")

call <SID>set_hi("rubyClass", s:pink, s:none, "NONE")
call <SID>set_hi("rubyFunction", s:light_purple, s:none, "NONE")
call <SID>set_hi("rubyInterpolationDelimiter", s:none, s:none, "NONE")
call <SID>set_hi("rubySymbol", s:light_purple, s:none, "NONE")
call <SID>set_hi("rubyConstant", s:mint, s:none, "NONE")
call <SID>set_hi("rubyStringDelimiter", s:light_blue, s:none, "NONE")
call <SID>set_hi("rubyBlockParameter", s:pink, s:none, "NONE")
call <SID>set_hi("rubyBlock", s:default_white, s:none, "NONE")
call <SID>set_hi("rubyInstanceVariable", s:pink, s:none, "NONE")
call <SID>set_hi("rubyInclude", s:pink, s:none, "NONE")
call <SID>set_hi("rubyGlobalVariable", s:light_yellow, s:none, "NONE")
call <SID>set_hi("rubyRegexp", s:light_yellow, s:none, "NONE")
call <SID>set_hi("rubyRegexpDelimiter", s:light_yellow, s:none, "NONE")
call <SID>set_hi("rubyEscape", s:lavender, s:none, "NONE")
call <SID>set_hi("rubyControl", s:lavender, s:none, "NONE")
call <SID>set_hi("rubyRepeat", s:lavender, s:none, "NONE")
call <SID>set_hi("rubyConditional", s:pink, s:none, "NONE")
call <SID>set_hi("rubyClassVariable", s:light_yellow, s:none, "NONE")
call <SID>set_hi("rubyOperator", s:pink, s:none, "NONE")
call <SID>set_hi("rubyException", s:mint, s:none, "NONE")
call <SID>set_hi("rubyPseudoVariable", s:mint, s:none, "NONE")
call <SID>set_hi("rubyRailsUserClass", s:mint, s:none, "NONE")
call <SID>set_hi("rubyRailsARAssociationMethod", s:mint, s:none, "NONE")
call <SID>set_hi("rubyRailsARMethod", s:mint, s:none, "NONE")
call <SID>set_hi("rubyRailsRenderMethod", s:mint, s:none, "NONE")
call <SID>set_hi("rubyRailsMethod", s:mint, s:none, "NONE")
call <SID>set_hi("rubyArrayDelimiter", s:pink, s:none, "NONE")
call <SID>set_hi("rubyInterpolation", s:light_purple, s:none, "NONE")
call <SID>set_hi("rubyInterpolationDelimiter", s:pink, s:none, "NONE")

call <SID>set_hi("erubyDelimiter", s:none, s:none, "NONE")
call <SID>set_hi("erubyRailsMethod", s:mint, s:none, "NONE")

call <SID>set_hi("htmlTag", s:none, s:none, "NONE")
call <SID>set_hi("htmlEndTag", s:none, s:none, "NONE")
call <SID>set_hi("htmlTagName", s:none, s:none, "NONE")
call <SID>set_hi("htmlArg", s:none, s:none, "NONE")
call <SID>set_hi("htmlSpecialChar", s:lavender, s:none, "NONE")

call <SID>set_hi("javaScriptFunction", s:mint, s:none, "NONE")
call <SID>set_hi("javaScriptRailsFunction", s:mint, s:none, "NONE")
call <SID>set_hi("javaScriptBraces", s:none, s:none, "NONE")

call <SID>set_hi("yamlKey", s:pink, s:none, "NONE")
call <SID>set_hi("yamlAnchor", s:none, s:none, "NONE")
call <SID>set_hi("yamlAlias", s:none, s:none, "NONE")
call <SID>set_hi("yamlDocumentHeader", s:light_yellow, s:none, "NONE")
call <SID>set_hi("yamlPlainScalar", s:light_blue, s:none, "NONE")
call <SID>set_hi("yamlBlockCollectionItemStart", s:pink, s:none, "NONE")

call <SID>set_hi("cssURL", s:dark_pink, s:none, "NONE")
call <SID>set_hi("cssFunctionName", s:mint, s:none, "NONE")
call <SID>set_hi("cssColor", s:lavender, s:none, "NONE")
call <SID>set_hi("cssPseudoClassId", s:light_yellow, s:none, "NONE")
call <SID>set_hi("cssClassName", s:light_yellow, s:none, "NONE")
call <SID>set_hi("cssValueLength", s:lavender, s:none, "NONE")
call <SID>set_hi("cssCommonAttr", s:mint, s:none, "NONE")
call <SID>set_hi("cssBraces", s:none, s:none, "NONE")

call <SID>set_hi("jsThis", s:pink, s:none, "NONE")
call <SID>set_hi("jsBraces", s:light_purple, s:none, "NONE")
call <SID>set_hi("jsGlobalObjects", s:mint, s:none, "NONE")

call <SID>set_hi("coffeeCurly", s:lavender, s:none, "NONE")
call <SID>set_hi("coffeeObjAssign", s:light_purple, s:none, "NONE")

call <SID>set_hi("cjsxAttribProperty", s:lavender, s:none, "NONE")

call <SID>set_hi("markdownH1", s:light_blue, s:none, "NONE")
call <SID>set_hi("markdownH2", s:light_blue, s:none, "NONE")
call <SID>set_hi("markdownH3", s:light_blue, s:none, "NONE")
call <SID>set_hi("markdownH4", s:light_blue, s:none, "NONE")
call <SID>set_hi("markdownH5", s:light_blue, s:none, "NONE")
call <SID>set_hi("markdownH6", s:light_blue, s:none, "NONE")
call <SID>set_hi("markdownHeadingDelimiter", s:light_blue, s:none, "NONE")
call <SID>set_hi("markdownRule", s:light_blue, s:none, "NONE")


" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg[0] .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
" source files
call NERDTreeHighlightFile('.c', s:dark_pink, 'NONE', 'NONE', 'NONE')
call NERDTreeHighlightFile('cpp', s:dark_pink, 'NONE', 'NONE', 'NONE')
call NERDTreeHighlightFile('h', s:dark_pink, 'NONE', 'NONE', 'NONE')
call NERDTreeHighlightFile('cc', s:dark_pink, 'NONE', 'NONE', 'NONE')
call NERDTreeHighlightFile('mm', s:dark_pink, 'NONE', 'NONE', 'NONE')
" shell scripts
call NERDTreeHighlightFile('sh', s:dark_blue, 'NONE', 'NONE', 'NONE')
call NERDTreeHighlightFile('py', s:dark_blue, 'NONE', 'NONE', 'NONE')
call NERDTreeHighlightFile('lua', s:dark_blue, 'NONE', 'NONE', 'NONE')
call NERDTreeHighlightFile('bash', s:dark_blue, 'NONE', 'NONE', 'NONE')
call NERDTreeHighlightFile('zsh', s:dark_blue, 'NONE', 'NONE', 'NONE')
" makefiles
call NERDTreeHighlightFile('mk', s:dark_green, 'NONE', 'NONE', 'NONE')
call NERDTreeHighlightFile('makefile', s:dark_green, 'NONE', 'NONE', 'NONE')
call NERDTreeHighlightFile('Makefile', s:dark_green, 'NONE', 'NONE', 'NONE')
call NERDTreeHighlightFile('configure', s:dark_green, 'NONE', 'NONE', 'NONE')

