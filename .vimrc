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


"execute pathogen#infect()


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


" solarized options 
set background=dark
"let g:solarized_termcolors=256      "16 | 256 
"let g:solarized_termtrans=1         " 0 | 1 
"let g:solarized_degrade =1          " 0 | 1 
let g:solarized_bold=1              " 1 | 0 
let g:solarized_underline=1         " 1 | 0 
let g:solarized_italic1=1           " 1 | 0 
"let g:solarized_contrast="normal"     " normal high low 
"let g:solarized_visibility="high"   " normal high low
set t_Co=256
"colorscheme solarized
"set nocompatible                                           
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
"let g:solarized_termtrans = 1
"let g:solarized_termcolors=256
"let g:solarized_bold = 1
"let g:solarized_underline = 1
"let g:solarized_italic = 1
highlight Comment cterm=bold
highlight Constant cterm=bold


"Nerd Tree
map <C-d> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows=0
"autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

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
