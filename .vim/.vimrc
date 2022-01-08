
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

set number "номер строки
set ruler 
set laststatus=2


nnoremap <Leader>c :set cursorline!<CR>


let g:airline_powerline_fonts = 1 "Включить поддержку Powerline шрифтов
let g:airline#extensions#keymap#enabled = 0 "Не показывать текущий маппинг
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" "Кастомная графа положения курсора
let g:Powerline_symbols='unicode' "Поддержка unicode
let g:airline#extensions#xkblayout#enabled = 0
let g:airline#extensions#branch#enabled=1

set ttimeoutlen=10 "Понижаем задержку ввода escape последовательностей
let &t_SI.="\e[5 q" "SI = режим вставки
let &t_SR.="\e[3 q" "SR = режим замены
let &t_EI.="\e[1 q" "EI = нормальный режим

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

" navigation on russian
nmap о j
nmap л k
nmap р h
nmap д l
nmap ш i
nmap ф a
nmap в d


set ffs=unix,dos,mac
set encoding=utf8

" tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>




" Plugins
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

    Plugin 'VundleVim/Vundle.vim'
    Plugin 'preservim/nerdtree'
    Plugin 'vim-airline/vim-airline'
    Plugin 'morhetz/gruvbox'
    Plugin 'tpope/vim-surround'
    Plugin 'tpope/vim-commentary'
    Plugin 'ap/vim-css-color'
    Plugin 'terryma/vim-multiple-cursors'
    Plugin 'preservim/tagbar'
    Plugin 'preservim/vimux'

call vundle#end()

filetype plugin indent on

" Python
let python_highlight_all = 1
set t_Co=256
nnoremap <silent> <special> <F10> :!python3 % <CR>


autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,match,case

" nerdtree
" Ctrl + w l|h - change window


" autoclose if nerdtree is last tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


nnoremap <silent> <special> <F3> :NERDTreeToggle <CR>

" ctags required
nnoremap <silent> <special> <F8> :TagbarToggle <CR>


let NERDTreeShowBookmarks = 1
let NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo', '\.vscode', '__pycache__']
let NERDTreeChDirMode=2
let NERDTreeKeepTreeInNewTab=1

" Close tree tab when open file
"let NERDTreeQuitOnOpen = 1


set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'iceberg',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }


" Colorscheme
colorscheme gruvbox
set bg=dark


let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

