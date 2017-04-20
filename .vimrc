" vvim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin('$HOME/.vim/bundle/')
"call vundle#begin('$USERPROFILE/vimfiles/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Plugin 'powerline/powerline'
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'
"Plugin 'Raimondi/delimitMate'
Plugin 'jiangmiao/auto-pairs'
Plugin 'uguu-org/vim-matrix-screensaver'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'mileszs/ack.vim'
" Plugin 'sjl/gundo.vim' "more friendly diff mode, but less shortcut keys
" options and python is required
Plugin 'mbbill/undotree'
Plugin 'majutsushi/tagbar'

"TODO: decide whith will remain
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
"Plugin 'ervandew/supertab'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'vim-syntastic/syntastic'

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
" Put your non-Plugin stuff after this line

set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

set langmenu=en_US
let $LANG = 'en_US'

set number
set relativenumber

set hidden
"allow moving the cursor freely during blockwise operation
set virtualedit+=block

set wrapscan

set hlsearch
set incsearch
set ignorecase
set smartcase
"set cindent"with vertical item list separated by commas, there is an isse with unwanted identation
syntax enable

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set showcmd
set wildmenu
"change working directory automatically to current opened file
set autochdir
"include all subdir during search
set path+=**

set cursorline
set cursorcolumn

set foldenable
set foldlevelstart=0
set foldnestmax=10

set shortmess+=I
set viminfo='9999,%             "store marks for 9999 files, remember buffer list

set undofile
if has("win32")
    set undodir=$HOME/.vim/logs/vimundo
else
    set undodir=~/.vim/logs/vimundo
endif
set undolevels=1000
set undoreload=10000

set background=dark

"solarized plugin option:
silent! colorscheme solarized
"tricky way to check if solarized colorscheme is available
if exists(":SolarizedOptions")
    let g:solarized_termcolors=16
    "turn off italic fonts (e.g. used in comment sections)
    let g:solarized_italic = 0
    " turn on experimental showing trail spaces feature
    let g:solarized_hitrail = 1
    colorscheme solarized

    "Invisible character colors 
    highlight NonText guifg=#4a4a59
    highlight SpecialKey guifg=#4a4a59
else
    colorscheme torte
endif

set laststatus=2 "always show status line

"airline plugin option
let g:airline_powerline_fonts = 1
"Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1

"font settings
if has("win32")
    set guifont=DejaVu_Sans_Mono_for_Powerline:h10
else
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
endif

" GUI OPTIONS - only affects gvim
if has("gui_running")
    set guioptions-=T           " No toolbar
    set guioptions-=m           " No menus
    set guioptions-=L           " No left scrollbar
    set guioptions-=r           " No right scrollbar
    if has("win32")
        let hostname = substitute(system('hostname'), '\n', '', '')
        if hostname == "main_michal"
            au GUIEnter * simalt ~s     " Start maximized, x-eng OS, s-pl OS
        elseif hostname == "e6420"
            au GUIEnter * simalt ~x     " Start maximized, x-eng OS, s-pl OS
        endif
    else
        call system('wmctrl -i -b add,maximized_vert,maximized_horz -r '.v:windowid)
    endif
endif

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

"when you forgot to sudo before editing a file that requires root privileges
cmap w!! w !sudo tee % >/dev/null

"change to current file working directory
nnoremap <F1> :cd %:p:h<CR>:pwd<CR>

"show differences between current and saved versions
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
nnoremap <F2> :DiffOrig<CR><c-w>r

"show/hide NERDTree pane on the left
nnoremap <F5> :NERDTreeToggle<cr>

"show/hide Undotree pane on the left
nnoremap <F6> :UndotreeToggle<CR>

"show/hide Tagbar pane on the right (function list)
nnoremap <F7> :TagbarToggle<CR>

"write, compile, program
nnoremap <F9> :w<CR>:make all<CR><CR>:make program<CR><CR>

"build the cross-reference recursively
nnoremap <F10> :!cd %:p:h & cscope -Rb<CR>

"yank visual selection to system clipboard
vnoremap <F11> "+y

"paste from the system clipboard
nnoremap <F12> "+p

"cscope configuration
set cscopequickfix=s-,c-,d-,i-,t-,e-

"corrections for functions with curly braces at the end of line
map [[ ?{<CR>w99[{\<SPACE>zt<C-y>
map ][ /}<CR>b99]}\<SPACE>
map ]] j0[[%/{<CR>\<SPACE>zt<C-y>
map [] k$][%?}<CR>\<SPACE>

"edit and source vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>G
nnoremap <leader>sv :source $MYVIMRC<cr>

"map ESCAPE key to convenient method
inoremap jk 

"remowe trailing spaces from specified type of files during writing
autocmd BufWritePre *.{c,cpp,h} %s/\s\+$//e

"repeat last command with the ENTER key
nnoremap <expr> <CR> empty(&buftype) ? '@@' : '<CR>'

"yank to end of line
noremap Y y$

"fix window mappings
nnoremap <silent> <Up> :cprevious<CR>
nnoremap <silent> <Down> :cnext<CR>
nnoremap <silent> <Left> :cpfile<CR>
nnoremap <silent> <Right> :cnfile<CR>

"simple mappings for commenting line
nnoremap <silent> <leader>c I//
nnoremap <silent> <leader>C ^xx

"Open file like vim-vinegar.
nnoremap <silent> - :silent edit <C-R>=empty(expand('%')) ? '.' : fnameescape(expand('%:p:h'))<CR><CR>

"disable last searching results and highlighted words
nnoremap <silent> <leader><space> :call clearmatches()<CR>:nohlsearch<CR>

"do not jump to the next match
nnoremap * *<c-o>

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

"different filetype association
au BufRead,BufNewFile *.can set filetype=c
au BufRead,BufNewFile *.cin set filetype=c

"define how to display non printed characters when 'list' option is active
set listchars=eol:¬,tab:▸-,

"switching between buffers
nnoremap <C-Tab> :bnext<cr>
nnoremap <C-S-Tab> :bprev<cr>

"mark and move up completed task
nnoremap <leader>u jmmk^r+ddgg}P'm

"paste actual date in following format: 2017-03-25
nnoremap <leader>d "=strftime("%Y-%m-%d")<CR>P
inoremap <leader>d <C-R>=strftime("%Y-%m-%d")<CR>

"surround with {} braces - obsolete, surround plugin does the same
nnoremap <leader>{ viWa}Bi{%

"mappings for visual block selections with mouse clicking
nnoremap <A-S-LeftMouse> mz<LeftMouse><C-v>g`zo<C-g>
inoremap <A-S-LeftMouse> <Esc><C-v>g`^mz<Esc>gi<LeftMouse><C-o><C-v>g`zo<C-g>
vnoremap <A-S-LeftDrag> <LeftDrag>
vnoremap <A-S-LeftMouse> <C-v><LeftMouse>mzgvg`z<C-g>

"VERY SIMPLE mapping
"create ticket
nnoremap <leader>ct IFZD :<cr><cr>Test scenario:<cr><cr>Expected:<cr><cr>Observed:ggf:i
"insert hardware version
inoremap <leader>ih I391_KKL_GR_3Bt_Or
"insert visual arrow pointer
inoremap <- <--- 

"quick font resizing
if has("unix")
    function! FontSizePlus ()
      let l:gf_size_whole = matchstr(&guifont, '\( \)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole + 1
      let l:new_font_size = ' '.l:gf_size_whole
      let &guifont = substitute(&guifont, ' \d\+$', l:new_font_size, '')
    endfunction

    function! FontSizeMinus ()
      let l:gf_size_whole = matchstr(&guifont, '\( \)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole - 1
      let l:new_font_size = ' '.l:gf_size_whole
      let &guifont = substitute(&guifont, ' \d\+$', l:new_font_size, '')
    endfunction
else
    function! FontSizePlus ()
      let l:gf_size_whole = matchstr(&guifont, '\(:h\)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole + 1
      let l:new_font_size = ':h'.l:gf_size_whole
      let &guifont = substitute(&guifont, ':h\d\+$', l:new_font_size, '')
    endfunction

    function! FontSizeMinus ()
      let l:gf_size_whole = matchstr(&guifont, '\(:h\)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole - 1
      let l:new_font_size = ':h'.l:gf_size_whole
      let &guifont = substitute(&guifont, ':h\d\+$', l:new_font_size, '')
    endfunction
endif

if has("gui_running")
    nnoremap <leader>- :call FontSizeMinus()<CR>
    nnoremap <leader>= :call FontSizePlus()<CR>
endif

"syntastic plugin default recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Keybindings for UltiSnips, all of these are ctrl + key
let g:UltiSnipsExpandTrigger       = '<c-j>'
let g:UltiSnipsListSnippets        = '<c-l>'
let g:UltiSnipsJumpForwardTrigger  = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
"for proper searching user defined snippets
set rtp+=~/

"TODO:
"set showmatch
"skip loading behaviours MSWIN
"let g:skip_loading_mswin = 1
"set cindent only for the C source code family

set rtp-=$HOME/vimfiles

