set number "номер строки
set ruler
set laststatus=2
set encoding=utf-8 "Ставит кодировку UTF-8
set nocompatible "Отключает обратную совместимость с Vi
syntax on "Включает подсветку синтаксиса

set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set nowrap

set noerrorbells
set novisualbell
set showcmd
set showtabline=2

set ignorecase
set smartcase
set hlsearch
set incsearch

set mousehide
set mouse=a

set colorcolumn=120
set scrolloff=7

set virtualedit=onemore  " allow for cursor beyond last character

" f4 toggle hlsearch
nnoremap <F4> :set invhlsearch<CR>

set ffs=unix,dos,mac
set encoding=utf8

" tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>