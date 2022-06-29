"------------------------
" General options
"----------------------------

set autoindent "autoindent always ON.
set expandtab " expand tabs
set shiftwidth=2 " spaces for autoindenting
set softtabstop=2 " remove a full pseudo-TAB when i press <BS>
set scrolloff=8 " Keep at least 8 lines below cursor
set ignorecase " to ignore case in searchs
set hidden " to gide warning when opening files
set encoding=utf-8 " always use unicode
set number relativenumber " Relative numbers for jumping
set nu rnu " Hybrid. Relative numbers and the current line number
set splitbelow splitright " Set the splice to open at the right side and below
set foldmethod=manual " To avoid performace issuaes, I never fold anything
set lazyredraw
set shell=zsh\ -i

" Directorio de plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-surround'
Plug 'joshdick/onedark.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'  " Temas para airline
Plug 'Yggdroot/indentLine'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'
call plug#end()

set termguicolors  " Activa true colors en la terminal
colorscheme onedark  " Activa tema onedark

" No mostrar en ciertos tipos de buffers y archivos
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#fnamemod = ':t'  " Mostrar sólo el nombre del archivo
let g:airline#extensions#tabline#formatter = 'default'
" Cargar fuente Powerline y símbolos (ver nota)
let g:airline_powerline_fonts = 1
let g:lens#disabled_filetypes = ['nerdtree', 'fzf']
let g:lens#animate = 0
let g:lens#height_resize_max = 20
let g:lens#height_resize_min = 5
let g:lens#width_resize_max = 80
let g:lens#width_resize_min = 20
let g:lens#disabled = 1

let g:NERDTreeChDirMode = 2  " Cambia el directorio actual al nodo padre actual
" Abrir/cerrar NERDTree con F2

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

let g:NERDTreeGitStatusShowIgnored = 1 " a heavy feature may cost much more time. default: 0
"---------------------------
" Keybindings
"----------------------------


let mapleader = ","

nmap <leader><leader>c oconsole.log({});<Esc>0t{la

inoremap <Left> <c-g>U<Left>
inoremap <Right> <c-g>U<Right>

" Whit leader p you can delete things without saving to register so you can

" paste what you have before
set noshowmode  " No mostrar el modo actual (ya lo muestra la barra de estado)

vnoremap <leader>p "_d

" Make window navigation less painful.

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Working with buffers is cool.

set hidden

map <C-d>  :bnext<CR>
map <C-a>  :bprev<CR>
imap <C-D> <Esc>:bnext<CR>a
imap <C-A> <Esc>:bprev<CR>a

noremap <silent> <Up> gk
noremap <silent> <Down> gj

"nnoremap <silent> <Leader>h+ :exe "resize " . (winheight(0) * 5/4)<CR> 
"nnoremap <silent> <Leader>h- :exe "resize " . (winheight(0) * 4/5)<CR>   

"nnoremap <silent> <Leader>w+ :exe "vertical resize " . (winwidth(0) * 5/4)<CR>  
"nnoremap <silent> <Leader>w- :exe "vertical resize " . (winwidth(0) * 4/5)<CR> 

nnoremap Y y$

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *zzzv
nnoremap <silent> <C-q> :lclose<bar>b#<bar>bd #<CR>

