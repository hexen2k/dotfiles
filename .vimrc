" vvim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=$HOME/.vim
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-signify'
Plug 'dolph/vim-colors-solarized-black'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jiangmiao/auto-pairs'
Plug 'uguu-org/vim-matrix-screensaver', { 'on':  'Matrix' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-eunuch'
Plug 'dhruvasagar/vim-prosession'
Plug 'gikmx/ctrlp-obsession'
Plug 'mhinz/vim-grepper'
Plug 'mbbill/undotree'
Plug 'majutsushi/tagbar'
Plug 'junegunn/vim-easy-align'
Plug 'vimwiki/vimwiki'
Plug 'coderifous/textobj-word-column.vim'
Plug 'rickhowe/diffchar.vim'
Plug 'rhysd/vim-clang-format'
Plug 'markonm/traces.vim' " highlights patterns and ranges for Ex commands in Command-line mode
" Plug 'sgur/vim-editorconfig'
Plug 'w0rp/ale'
Plug 'simeji/winresizer'
Plug 'bfrg/vim-cpp-modern'
Plug 'octref/RootIgnore' " set 'wildignore' from git repo root or home folder
Plug 'junegunn/goyo.vim'
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'machakann/vim-highlightedyank' " highlight yanked region
Plug 'romainl/vim-cool' " disables search highlighting when you are done searching and re-enables it when you search again

" vim-snipmate section
Plug 'garbas/vim-snipmate' | Plug 'MarcWeber/vim-addon-mw-utils' | Plug 'tomtom/tlib_vim'

" snippet files for snipmate
Plug 'honza/vim-snippets'


" TODO: check this colorscheme
" https://github.com/morhetz/gruvbox
" TODO: vim wrapper for ansynchrous tasks
" Plug 'skywind3000/asyncrun.vim'


" VIM-PLUG MANAGER USAGE:
" Make sure you use single quotes
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()

" Put your non-Plugin stuff after this line

filetype plugin indent on    " required


set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

set langmenu=en_US
let $LANG = 'en_US'

set lazyredraw

set number
set relativenumber
set nrformats=bin,hex

set hidden
" allow moving the cursor freely during blockwise operation
set virtualedit+=block
" auto-pairs delete_in_pair feature fix (obligatory backspace=start),
" allow backspaces everywhere
set backspace=indent,eol,start
" auto-pairs Fly mode ON
let g:AutoPairsFlyMode = 1

set wrapscan

set hlsearch
set incsearch
set ignorecase
set smartcase
" set cindent"with vertical item list separated by commas, there is an isse with unwanted identation
syntax enable

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set showcmd
set wildmenu
set wildmode=list,full
" allows you to search for foo and find Foo
set wildignorecase

" wildmenu ignore filename mask
set wildignore=*.swp,*.bak
set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
set wildignore+=tags
set wildignore+=*.tar.*
set wildignore+=*.cbf,*.gen,*.pdf,*.zip,*.7z,*.blf,*.db

set splitbelow "command :sp insert new window below active one
set splitright "command :vs inserts new window on the right side
set linebreak "do not break words
" NO change working directory automatically to current opened file
set noautochdir
" include all subdir during search
set path+=**

set foldenable
set foldlevelstart=0
set foldnestmax=10

set shortmess+=I
" set viminfo='9999,%             "store marks for 9999 files, remember buffer list
set viminfo='9999             "store marks for 9999 files, changed for obsession compatibility

set noswapfile
set undofile
if has("win32")
    let g:python3_host_prog  = 'C:\apps\python3\python.exe'
    set undodir=$HOME/.vim/logs/vimundo
else
    set undodir=~/.vim/logs/vimundo
endif
set viewdir=~/.vim/view
set undolevels=1000
set undoreload=10000

set laststatus=2 "always show status line

" airline plugin option
let g:airline_powerline_fonts = 1
" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1
" prepend a '$' when vim-obsession is enabled
let g:airline_section_z = airline#section#create(['%{ObsessionStatus(''$'', '''')}', 'windowswap', '%3p%% ', 'linenr', ':%3v '])

" CtrlPObsession plugin config
nnoremap <Leader>ss :CtrlPObsession<CR>

" font settings
if has("win32")
    set guifont=DejaVu_Sans_Mono_for_Powerline:h10
else
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
endif

set background=dark

silent! colorscheme solarized

" tricky way to check if solarized colorscheme is available
if exists(":SolarizedOptions")
    "turn off italic fonts (e.g. used in comment sections)
    let g:solarized_italic = 0
    " turn on experimental showing trail spaces feature
    let g:solarized_hitrail = 1
    colorscheme solarized
    "high contrast in diff mode
    let g:solarized_diffmode="high"
    "REMARK: after setting g:solarized_diffmode colorscheme has to be reloaded
    "Invisible character colors
    highlight NonText guifg=#4a4a59
    highlight SpecialKey guifg=#4a4a59
    "special list characters visibility level
    let g:solarized_visibility="normal"
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
        elseif hostname == "DESKTOP-DM55UGI"
            au GUIEnter * simalt ~x
        else
            au GUIEnter * simalt ~x
        endif
    else
        call system('wmctrl -i -b add,maximized_vert,maximized_horz -r '.v:windowid)
    endif
else "terminal mode/no gui
    set t_Co=256
    let g:solarized_termcolors=256
endif

colorscheme solarized
" set proper colour of signcolumn - broken by solarized colorscheme
highlight SignColumn ctermbg=NONE cterm=NONE guibg=NONE gui=NONE
" better contrast - overwrite setting from solarized plugin - those lines have
" to be placed after [colorscheme solarized] command
highlight Normal guifg=LightGray
highlight Normal ctermfg=LightGray
highlight Comment guifg=DarkGray
highlight Comment ctermfg=DarkGray
highlight LineNr guifg=yellow

set cursorline
set cursorcolumn

" shift lines or selection in normal, input and visual mode
nnoremap <A-j> :m .+1<CR>
nnoremap <A-k> :m .-2<CR>
inoremap <A-j> <Esc>:m .+1<CR>gi
inoremap <A-k> <Esc>:m .-2<CR>gi
vnoremap <A-j> :m '>+1<CR>gv
vnoremap <A-k> :m '<-2<CR>gv

" shift and autoformat lines or selection in normal, input and visual mode
nnoremap <S-A-j> :m .+1<CR>==
nnoremap <S-A-k> :m .-2<CR>==
inoremap <S-A-j> <Esc>:m .+1<CR>==gi
inoremap <S-A-k> <Esc>:m .-2<CR>==gi
vnoremap <S-A-j> :m '>+1<CR>gv=gv
vnoremap <S-A-k> :m '<-2<CR>gv=gv

" when you forgot to sudo before editing a file that requires root privileges
cmap w!! w !sudo tee % >/dev/null

" change to current file working directory
nnoremap <F1> :cd %:p:h<CR>:pwd<CR>

" show differences between current and saved versions
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
nnoremap <F2> :DiffOrig<CR><c-w>r

" show/hide NERDTree pane on the left
nnoremap <F5> :NERDTreeToggle<cr>

" show/hide Undotree pane on the left
nnoremap <F6> :UndotreeToggle<CR>

" show/hide Tagbar pane on the right (function list)
nnoremap <F7> :TagbarToggle<CR>

" write, compile, program
nnoremap <F9> :w<CR>:make all<CR><CR>:make program<CR><CR>

" build the cross-reference recursively
nnoremap <F10> :!cd %:p:h & cscope -Rb<CR>

" yank visual selection to system clipboard
vnoremap <F11> "+y

" paste from the system clipboard
nnoremap <F12> "+p

" cscope configuration
set cscopequickfix=s-,c-,d-,i-,t-,e-

" corrections for functions with curly braces at the end of line
map [[ ?{<CR>w99[{\<SPACE>
map ][ /}<CR>b99]}\<SPACE>
map ]] j0[[%/{<CR>\<SPACE>
map [] k$][%?}<CR>\<SPACE>

" edit and source vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>G
nnoremap <leader>sv :source $MYVIMRC<cr>

" map ESCAPE key to convenient method
inoremap jk 

" remove trailing spaces from specified type of files during writing
autocmd BufWritePre *.{c,cpp,h} %s/\s\+$//e

" repeat last command with the ENTER key
nnoremap <expr> <CR> empty(&buftype) ? '@@' : '<CR>'

" yank to end of line
noremap Y y$

" fix window mappings
nnoremap <silent> <Up> :cprevious<CR>
nnoremap <silent> <Down> :cnext<CR>
nnoremap <silent> <Left> :cpfile<CR>
nnoremap <silent> <Right> :cnfile<CR>

" simple mappings for commenting line
nnoremap <silent> <leader>c I//
nnoremap <silent> <leader>C ^xx

" disable last searching results and highlighted words
nnoremap <silent> <leader><space> :call clearmatches()<CR>:nohlsearch<CR>

" do not jump to the next match
nnoremap * *<c-o>

" delete white spaces at the end of the line and set cursor on previous position
nnoremap <leader>w mm:%s/\s\+$//<cr>:let @/=''<cr>`m

" convert to upper case
nnoremap <leader>U gUiw
inoremap <c-u> gUiwea

" reselect recently pasted area
nnoremap <leader>v `[v`]

" source selection or line immediatelly
vnoremap <leader>S y:execute @@<cr>
nnoremap <leader>S ^vg_y:execute @@<cr>

" select (charwise) the contents of the current line, excluding indentation.
nnoremap vv ^vg_

" simple calculator
inoremap <c-b> <c-o>yiW<End>=<c-r>=<c-r>0<cr>

" visvim manual surround
vmap <leader>( c(jkpa)jk
vmap <leader>[ c[jkpa]jk
vmap <leader>{ c{jkpa}jk

" ack plugin configuration
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

" different filetype association
au BufRead,BufNewFile *.can set filetype=c
au BufRead,BufNewFile *.cin set filetype=c
autocmd BufRead,BufNewFile *.arg set filetype=tcl

" define how to display non printed characters when 'list' option is active
set listchars=eol:¬,tab:▸-,

" switching between buffers
nnoremap <C-Tab> :bnext<cr>
nnoremap <C-S-Tab> :bprev<cr>

" mark and move up completed task
nnoremap <leader>u jmmk^r+ddgg}P'm

" paste actual date in following format: 2017-03-25
nnoremap <leader>d "=strftime("%Y-%m-%d")<CR>P
inoremap <leader>d <C-R>=strftime("%Y-%m-%d")<CR>

" surround with {} braces - obsolete, surround plugin does the same
nnoremap <leader>{ viWa}Bi{%

" mappings for visual block selections with mouse clicking
nnoremap <A-S-LeftMouse> mz<LeftMouse><C-v>g`zo<C-g>
inoremap <A-S-LeftMouse> <Esc><C-v>g`^mz<Esc>gi<LeftMouse><C-o><C-v>g`zo<C-g>
vnoremap <A-S-LeftDrag> <LeftDrag>
vnoremap <A-S-LeftMouse> <C-v><LeftMouse>mzgvg`z<C-g>

" VERY SIMPLE mapping
" create ticket
nnoremap <leader>ct IFZD :<cr><cr>Test scenario:<cr><cr>Expected:<cr><cr>Observed:ggf:i
" insert hardware version
inoremap <leader>ih I391_KKL_GR_3Bt_Or
" insert visual arrow pointer
inoremap <- <---
" parse time buffer
map <leader>pt :so ~\.vim\myscripts\parseTimeV2.vim<CR>

" quick font resizing
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

let g:signify_vcs_list = [ 'git' ]

" vimwiki configuration
" To use Markdown's wiki markup:
let g:vimwiki_list = [{'path': '~/vimwiki/',
            \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown',
                  \ '.mkd': 'markdown',
                  \ '.wiki': 'media'}
" Allow keep custom folding settings
let g:vimwiki_folding = 'custom'
map <leader>md :!pandoc %:p -f markdown -t html -s -o %:r.html<CR>
" set filetype vimwiki to all files with specific directory in the path
autocmd BufRead,BufNewFile */vimwiki/*.md set filetype=vimwiki

" for proper searching user defined snippets
set rtp+=~/.vim

" enable extended % jumping functionality
packadd! matchit

" exclude regexp patterns for filetypes or filepaths
let g:editorconfig_blacklist = {
    \ 'filetype': ['vimrc', '.vimrc', '.cfg'],
    \ 'pattern': ['vimrc']}

" grepper plugin configuration
let g:grepper = {}
let g:grepper.tools = ['rg','git','grep']
" search for the current word
nnoremap <leader>* :Grepper -cword -noprompt<CR>
" search for the current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" ALE linter configuration
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)
" Do not lint or fix can and cin files.
let g:ale_pattern_options = {
\ '\.can$': {'ale_linters': [], 'ale_fixers': []},
\ '\.cin$': {'ale_linters': [], 'ale_fixers': []},
\}

" snipmate plugin configuration
imap <c-j> <Plug>snipMateNextOrTrigger
smap <C-j> <Plug>snipMateNextOrTrigger
imap <c-k> <Plug>snipMateBack
smap <c-k> <Plug>snipMateBack

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" easy PageUp/Down screen scrolling
noremap <PageUp> 3
noremap <PageDown> 3

" start window resize mode
let g:winresizer_start_key = '<leader>r'

" scrolling offset vertical and horizontal
set scrolloff=5
set sidescrolloff=20

" https://vim.fandom.com/wiki/Convert_between_hex_and_decimal
" USAGE:
" Command   Description
" :Dec2hex 496  Displays 1f0 (hex equivalent of decimal 496).
" :Dec2hex  Converts all decimal numbers to hex in current line.
" :'<,>'Dec2hex Same, for all visually selected text (v, V, or ^V).
" :%Dec2hex Same, for all lines in buffer.
" :Hex2dec 0x1f0    Displays 496 (decimal equivalent of hex 1f0).
" :Hex2dec 1f0  Same ("0x" is optional in an argument).
" :Hex2dec  Converts all "0x" hex numbers to decimal in current line.
" :'<,>'Hex2dec Same, for all visually selected text (v, V, or ^V).
" :%Hex2dec Same, for all lines in buffer.
command! -nargs=? -range Dec2hex call s:Dec2hex(<line1>, <line2>, '<args>')
function! s:Dec2hex(line1, line2, arg) range
  if empty(a:arg)
    if histget(':', -1) =~# "^'<,'>" && visualmode() !=# 'V'
      let cmd = 's/\%V\<\d\+\>/\=printf("0x%x",submatch(0)+0)/g'
    else
      let cmd = 's/\<\d\+\>/\=printf("0x%x",submatch(0)+0)/g'
    endif
    try
      execute a:line1 . ',' . a:line2 . cmd
    catch
      echo 'Error: No decimal number found'
    endtry
  else
    echo printf('%x', a:arg + 0)
  endif
endfunction

command! -nargs=? -range Hex2dec call s:Hex2dec(<line1>, <line2>, '<args>')
function! s:Hex2dec(line1, line2, arg) range
  if empty(a:arg)
    if histget(':', -1) =~# "^'<,'>" && visualmode() !=# 'V'
      let cmd = 's/\%V0x\x\+/\=submatch(0)+0/g'
    else
      let cmd = 's/0x\x\+/\=submatch(0)+0/g'
    endif
    try
      execute a:line1 . ',' . a:line2 . cmd
    catch
      echo 'Error: No hex number starting "0x" found'
    endtry
  else
    echo (a:arg =~? '^0x') ? a:arg + 0 : ('0x'.a:arg) + 0
  endif
endfunction

" configuration for AutoHotKey scripts
augroup ahk_script
    autocmd!
    autocmd FileType autohotkey
                \ setlocal commentstring=;%s
augroup end

" vim-python/python-syntax plugin configuration
let g:python_highlight_all = 1

" automaticly reload outside changed file
set autoread

" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    silent :e " this will reload the file without trickeries
              "(DOS line endings will be shown entirely )
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

nnoremap <C-H> :Hexmode<CR>
inoremap <C-H> <Esc>:Hexmode<CR>
vnoremap <C-H> :<C-U>Hexmode<CR>

" mappings for fast background switching
nmap <leader>bl :set background=light<CR>
nmap <leader>bd :set background=dark<CR>

" fugitive: show read only history log buffer
nnoremap <leader>sl :G -p log --oneline --graph --decorate --all<CR>L

" highlightedyank yank time
let g:highlightedyank_highlight_duration = 200

" vim-cool plugin configuration
" BUG: probably if search word is in the first line this plugin disable
" highlighting automaticaly, you have to press n key as workaround
" Show number of matches in the command-line (/plug match N of X)
 let g:CoolTotalMatches = 1
" restore proper word highlighting searched by * (broken by vim-cool plugin)
nnoremap * viwo*N

" swap word objects forwards
nnoremap <silent> <leader>sw "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>:nohlsearch<CR>

" swap word objects backwards
nnoremap <silent> <leader>SW "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:nohlsearch<CR>

" swap paragraph with the next
nnoremap <leader>sp {dap}Pj

" swap paragraph with the previous
nnoremap <leader>SP {dap{Pj

" TODO:
" set showmatch
" skip loading behaviours MSWIN
" let g:skip_loading_mswin = 1
" set cindent only for the C source code family

set rtp-=$HOME/vimfiles

