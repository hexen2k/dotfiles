set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$USERPROFILE/vimfiles/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'powerline/powerline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'Raimondi/delimitMate'
Plugin 'uguu-org/vim-matrix-screensaver'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'ctrlpvim/ctrlp.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this linecolorscheme torte

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

set langmenu=en_US
let $LANG = 'en_US'

set number
set relativenumber
set wrapscan
set hlsearch
set incsearch
set ignorecase
set smartcase
syntax enable
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set showcmd
set cursorline
set cursorcolumn
set wildmenu
set showmatch
nnoremap <leader><space> :nohlsearch<CR>
set foldenable
set foldlevelstart=10
set foldnestmax=10
"let g:move_map_keys = 0
"vmap <C-j> <Plug>MoveBlockDown
"vmap <C-k> <Plug>MoveBlockUp
"nmap <A-j> <Plug>MoveLineDown
"nmap <A-k> <Plug>MoveLineUp

"shift lines or selection in normal, input and visual mode
nnoremap <A-j> :m .+1<CR>
nnoremap <A-k> :m .-2<CR>
inoremap <A-j> <Esc>:m .+1<CR>gi
inoremap <A-k> <Esc>:m .-2<CR>gi
vnoremap <A-j> :m '>+1<CR>gv
vnoremap <A-k> :m '<-2<CR>gv

"shift and autoformat lines or selection in normal, input and visual mode
nnoremap <S-A-j> :m .+1<CR>==
nnoremap <S-A-k> :m .-2<CR>==
inoremap <S-A-j> <Esc>:m .+1<CR>==gi
inoremap <S-A-k> <Esc>:m .-2<CR>==gi
vnoremap <S-A-j> :m '>+1<CR>gv=gv
vnoremap <S-A-k> :m '<-2<CR>gv=gv

set undofile
set undodir="c:\logs\vimundo"
set undolevels=1000
set undoreload=10000

"solarized plugin option:
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized
"turn off annoying italic fonts
let g:solarized_italic=(abs(g:solarized_italic-1)) | colorscheme solarized
" turn on experimental showing trail spaces feature
let g:solarized_hitrail=(abs(g:solarized_hitrail-1)) | colorscheme solarized

set guifont=DejaVu_Sans_Mono_for_Powerline:h10
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2 "always show status line
"_________________________________________________________________________
" GUI OPTIONS - only affects gvim
"
if has("gui_running")
    set hlsearch                " Highlight last used search pattern
    au GUIEnter * simalt ~x     " Start maximized
    set guioptions-=T           " No toolbar
    set guioptions-=m           " No menus
    set guioptions-=L           " No left scrollbar
    set guioptions-=r           " No right scrollbar
endif
nnoremap <F12> :!cd %:p:h & cscope -Rb<CR>
set viminfo='9999,%             "store marks for 9999 files, remember buffer list
nnoremap <F11> :w<CR>:make all<CR><CR>:make program<CR><CR>
map [[ ?{<CR>w99[{\<SPACE>zt<C-y>
map ][ /}<CR>b99]}\<SPACE>
map ]] j0[[%/{<CR>\<SPACE>zt<C-y>
map [] k$][%?}<CR>\<SPACE>
nnoremap <F1> :cd %:p:h<CR>:pwd<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
inoremap jk 
autocmd BufWritePre *.{c,cpp,h} %s/\s\+$//e
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
nnoremap <F2> :DiffOrig<CR><c-w>r
nnoremap <expr> <CR> empty(&buftype) ? '@@' : '<CR>'
noremap Y y$
nnoremap <silent> <Up> :cprevious<CR>
nnoremap <silent> <Down> :cnext<CR>
nnoremap <silent> <Left> :cpfile<CR>
nnoremap <silent> <Right> :cnfile<CR>
nnoremap <silent> <leader>c I//
nnoremap <silent> <leader>C ^xx
" Like vim-vinegar.
nnoremap <silent> - :silent edit <C-R>=empty(expand('%')) ? '.' : fnameescape(expand('%:p:h'))<CR><CR>
nnoremap <f5> :NERDTreeToggle<cr>
