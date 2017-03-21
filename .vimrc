set rtp+=$HOME/vimfiles/plugins/*
" set UTF-8 encoding
set enc=utf-8
"set fenc=utf-8
"set termencoding=utf-8

set langmenu=en_US
let $LANG = 'en_US'

set shortmess+=I
syntax enable
set hlsearch
set incsearch
set ignorecase
set smartcase
set number
set relativenumber
set autoindent
set smartindent
"set cindent"with vertical item list separated by commas, there is an isse with unwanted identation
set tabstop=4
set softtabstop=4
set shiftwidth=4	"idents will have a witdh of 4
set expandtab	"expand TABs to spaces
set showcmd
set cursorline
set cursorcolumn
set wildmenu
nnoremap <leader><space> :nohlsearch<CR>
"show statusbar always
set laststatus=2
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
set undodir=C:\logs\vimundo
set undolevels=1000
set undoreload=10000

"different filetype association
au BufRead,BufNewFile *.can set filetype=c
au BufRead,BufNewFile *.cin set filetype=c

"if solarized theme is unavailable set:
"colorscheme torte

"solarized theme connfiguration
syntax enable
set background=dark
colorscheme solarized
"turn off annoying italic fonts
let g:solarized_italic=(abs(g:solarized_italic-1)) | colorscheme solarized
" turn on experimental showing trail spaces feature
let g:solarized_hitrail=(abs(g:solarized_hitrail-1)) | colorscheme solarized

"airline plugin configuration
let g:airline_powerline_fonts = 1
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
"Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1

"skip loading behaviours MSWIN
let g:skip_loading_mswin = 1

"_________________________________________________________________________
" GUI OPTIONS - only affects gvim
" based on: https://engineering.purdue.edu/ece264/16au/static/.vimrc.html
if has("gui_running")
    set hlsearch                " Highlight last used search pattern
    au GUIEnter * simalt ~x     " Start maximized
    set guioptions-=T           " No toolbar
    set guioptions-=m           " No menus
    set guioptions-=L           " No left scrollbar
    set guioptions-=r           " No right scrollbar
endif
"set lines=999 columns=999
set cscopequickfix=s-,c-,d-,i-,t-,e-
set viminfo='9999,%             "store marks for 9999 files, remember buffer list
set listchars=eol:¬,tab:▸-,
"Invisible character colors 
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
map [[ ?{<CR>w99[{\<space>zt
map ][ /}<CR>b99]}\<space>zb
map ]] j0[[%/{<CR>\<space>zt
map [] k$][%?}<CR>\<space>zb

nnoremap <leader>d "=strftime("%Y-%m-%d")<CR>P
inoremap <leader>d <C-R>=strftime("%Y-%m-%d")<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR> 
inoremap jk <esc>
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
nnoremap <leader>{ viWa}Bi{%
nnoremap <silent> <Up> :cprevious<CR>
nnoremap <silent> <Down> :cnext<CR>
nnoremap <silent> <Left> :cpfile<CR>
nnoremap <silent> <Right> :cnfile<CR>
noremap Y y$
nnoremap <expr> <CR> empty(&buftype) ? '@@' : '<CR>'
nnoremap <F1> :cd %:p:h<CR>:pwd<CR>
nnoremap <F2> :DiffOrig<CR><C-W>r
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <F6> :UndotreeToggle<CR>
vnoremap <F11> "+y
nnoremap <F12> "+p
nnoremap <A-S-LeftMouse> mz<LeftMouse><C-v>g`zo<C-g>
inoremap <A-S-LeftMouse> <Esc><C-v>g`^mz<Esc>gi<LeftMouse><C-o><C-v>g`zo<C-g>
vnoremap <A-S-LeftDrag> <LeftDrag>
vnoremap <A-S-LeftMouse> <C-v><LeftMouse>mzgvg`z<C-g>
nnoremap <leader>ct IFZD :<cr><cr>Test scenario:<cr><cr>Expected:<cr><cr>Observed:ggf:i
inoremap <- <--- 
inoremap <leader>ih I391_KKL_GR_3Bt_Or
"delete white spaces at the end of the line and set cursor on previous position
nnoremap <leader>w mm:%s/\s\+$//<cr>:let @/=''<cr>`m
"do not jump to the next match
nnoremap * *<c-o>
"convert to upper case
nnoremap <leader>U gUiw
inoremap <c-u> gUiwea
"reselect recently pasted area
nnoremap <leader>V V`]
"source selection or line immediatelly
vnoremap <leader>S y:execute @@<cr>
nnoremap <leader>S ^vg_y:execute @@<cr>
"select (charwise) the contents of the current line, excluding indentation.
nnoremap vv ^vg_
"simple calculator
inoremap <c-b> <c-o>yiW<End>=<c-r>=<c-r>0<cr>
"indent-guides plugin configuration
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2
"switching between buffers
nnoremap <C-Tab> :bnext<cr>
nnoremap <C-S-Tab> :bprev<cr>
