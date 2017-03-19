set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
"call vundle#begin('$USERPROFILE/vimfiles/bundle/')
" alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/vimfiles/bundle/')

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
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-speeddating'
Plugin 'mileszs/ack.vim'
Plugin 'sjl/gundo.vim'
Plugin 'msanders/snipmate.vim'

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

set number
set relativenumber
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
set wildmenu
set showmatch
set foldenable
set foldlevelstart=10
set foldnestmax=10
let g:move_map_keys = 0
vmap <C-j> <Plug>MoveBlockDown
vmap <C-k> <Plug>MoveBlockUp
nmap <A-j> <Plug>MoveLineDown
nmap <A-k> <Plug>MoveLineUp
set laststatus=2
set undofile
set undodir="~/vimfiles/undodir"
set undolevels=1000
set undoreload=10000

"solarized plugin option:
let g:solarized_termcolors=16
syntax enable
set background=dark
colorscheme solarized
"underline unwanted spaces at the end of line
let g:solarized_hitrail=1

set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"_________________________________________________________________________
" GUI OPTIONS - only affects gvim
"
if has("gui_running")
    set hlsearch                " Highlight last used search pattern
"    au GUIEnter * simalt ~s     " Start maximized
    set guioptions-=T           " No toolbar
    set guioptions-=m           " No menus
    set guioptions-=L           " No left scrollbar
    set guioptions-=r           " No right scrollbar
    call system('wmctrl -i -b add,maximized_vert,maximized_horz -r '.v:windowid)
endif
nnoremap <F12> :!cd %:p:h & cscope -Rb<CR>
"air-line
"let g:airline_powerline_fonts = 1

"if !exists('g:airline_symbols')
"let g:airline_symbols = {}
"endif
"
"" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'
"
"" airline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''
"

"do not jump to the next match
nnoremap * *<c-o>
"faster version of ESC key
inoremap jk 
"edit my vimrc
nnoremap <leader>ev :vsplit<cr>:e $MYVIMRC<cr>G
"source my vimrc file
nnoremap <leader>sv :so $MYVIMRC<cr>
"disable last searching results
nnoremap <leader><space> :noh<cr>:call clearmatches()<cr>
"delete white spaces at the end of the line and set cursor on previous position
nnoremap <leader>w mm:%s/\s\+$//<cr>:let @/=''<cr>`m
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
"ack plugin configuration
let g:ackprg = 'ag --nogroup --nocolor --column' "change Ack to Ag (silver searcher)

" Highlight Word {{{
"
" This mini-plugin provides a few mappings for highlighting words temporarily.
"
" Sometimes you're looking at a hairy piece of code and would like a certain
" word or two to stand out temporarily.  You can search for it, but that only
" gives you one color of highlighting.  Now you can use <leader>N where N is
" a number from 1-6 to highlight the current word in a specific color.

function! HiInterestingWord(n) " {{{
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
endfunction " }}}

function! VisualHiInterestingWord(n) " {{{
    " Save our location.
"    normal! mz

    " Yank the current selection into the z register.
    normal! gv"zy

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V' . escape(@z, '\')

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `[
endfunction " }}}

" Mappings {{{

nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>

vnoremap <silent> <leader>1 :call VisualHiInterestingWord(1)<cr>
vnoremap <silent> <leader>2 :call VisualHiInterestingWord(2)<cr>
vnoremap <silent> <leader>3 :call VisualHiInterestingWord(3)<cr>
vnoremap <silent> <leader>4 :call VisualHiInterestingWord(4)<cr>
vnoremap <silent> <leader>5 :call VisualHiInterestingWord(5)<cr>
vnoremap <silent> <leader>6 :call VisualHiInterestingWord(6)<cr>

" }}}
" Default Highlights {{{

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

" }}}

" }}}

" Visual Mode */# from Scrooloose {{{

function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" }}}
