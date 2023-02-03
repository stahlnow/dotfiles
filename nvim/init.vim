" #############################################################################################################
" ############################################################################################### Plugin setup
" #############################################################################################################
" https://github.com/junegunn/vim-plug
set nocompatible              " be iMproved, required
filetype off                  " required

" must be before Plug 'averms/black-nvim' ....
let g:python3_host_prog = $HOME . '/.local/venv/nvim/bin/python'

" Make sure you use single quotes for Plug
"""""""""""""""""""""""""""""""""""""""""""""" essential plugins
call plug#begin(stdpath('data') . '/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" TComment
Plug 'tomtom/tcomment_vim'

" Linter
Plug 'dense-analysis/ale'

Plug 'posva/vim-vue'

" This plugin automatically adjusts 'shiftwidth' and 'expandtab' heuristically based on the current file
" Plug 'tpope/vim-sleuth'

" NERDTree Ctrl+n
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Help fix the ssh copy/paste madness
Plug 'ojroques/vim-oscyank', {'branch': 'main'}

"""""""""""""""""""""""""""""""""""""""""""""" fancy plugins
" Git blame
Plug 'tveskag/nvim-blame-line'

" Unicode plugin
Plug 'chrisbra/unicode.vim'

" Git wrapper
" usage: :Git status, :help fugitive
Plug 'tpope/vim-fugitive'

Plug 'ervandew/supertab'

" Lean & mean status/tabline for vim that's light as air.
Plug 'vim-airline/vim-airline'

" Colorizer (:h Colorizer) for visualising color codes like #ff00ff or 'green'
Plug 'chrisbra/Colorizer'

" Show git changes
Plug 'airblade/vim-gitgutter'

" Auto-reload file that changed on disk
Plug 'djoshea/vim-autoread'

" Base 16 colorscheme
Plug 'RRethy/nvim-base16'

" Black for python (https://github.com/averms/black-nvim)
Plug 'averms/black-nvim', {'do': ':UpdateRemotePlugins'}

" python docstring generator :Pydocstring
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }

" icons
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()
filetype on " turn filetype back on

" #############################################################################################################
" ############################################################################################### General setup
" #############################################################################################################

" Map space key as <Leader>
nnoremap <SPACE> <Nop>
let mapleader=" "

set clipboard+=unnamedplus              " use clipboard instead of vim registers
set number    				" show line numbers
set showmatch matchtime=2               " briefly show the matching bracket {[( when typing )]}
set title                               " enable 'title' as window name
set titlestring=%t                      " set filename as title
set ignorecase                          " ignore case when searching
set splitbelow
set splitright
set whichwrap+=<,>,[,]                  " have <Left> and <Right> go across lines

set backupdir=~/.vim/backup//
set directory=~/.vim/swp//
set shortmess+=A            " don't show message when an existing swap file is found.

" use with :find for opening files or b: for jumping to buffers
" finds (nested) files in subdirectories, can use wildmarks :find *.cpp
set path+=**

" 1st tab:         Complete the longest match and bring up 'wildmenu'
" Additional tabs: Cycle through the menu
set wildmode=longest:full,full

set expandtab " On pressing tab, insert spaces
set tabstop=2 " define width of a <Tab> character
set shiftwidth=2 " determines how many blanks are inserted when using the > and < commands, and when automatic indentation is used. If set to 0, it uses the value of tabstop.
set softtabstop=-1 " Use value of shiftwidth
set smarttab       " Always use shiftwidth
set autoindent
set smartindent

autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType scss   setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yaml   setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType vue    setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType js     setlocal ts=2 sts=2 sw=2 expandtab


let g:pyindent_open_paren = 'shiftwidth()'
let g:pyindent_nested_paren = 'shiftwidth()'
let g:pyindent_continue = 'shiftwidth()'
let g:pyindent_close_paren = '-shiftwidth()'

" simple vimdiff highlight
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

" #############################################################################################################
" ############################################################################################### Key mappings
" #############################################################################################################
" remap ^ to 1 to use 1 as 'go to first character of line'
noremap 1 ^

" Insert newline without entering insert mode and staying on same line
nmap <CR> o<Esc>k

" Make double-<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" q starts visual block mode
nnoremap q <c-V>

" Paste over without overwriting register
xnoremap <expr> p 'pgv"'.v:register.'y`>'

" toggle paste mode with F2
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" show fzf buffers and switch by typing a number / or search
nnoremap <F5> :Buffers<CR>

nnoremap <Leader>s :update<CR>
nnoremap <Leader>d :bd<CR>
nnoremap <Leader>q :q!<CR>

" jump to next/previous change
nnoremap <Leader>n ]c
nnoremap <Leader>p [c

" tcomment_vim
nnoremap <Leader>c :TComment<CR>
xnoremap <Leader>c :TCommentBlock<CR>

" fzf bindings
nnoremap <Leader>a :Ag<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>t :Tags<CR>
nnoremap <Leader>o :Buffers<CR>

nnoremap <Leader>bl :Black<CR>

" use plugin to yank from anywhere (https://github.com/ojroques/vim-oscyank)
vnoremap <Leader>y :OSCYank<CR>

" use space + D for delete to black hole register
nnoremap <Leader>D "_d
xnoremap <Leader>D "_d

nnoremap <silent> <Leader>b :ToggleBlameLine<CR>

" Go to buffer by number
nnoremap <Leader>1 :buffer 1<CR>
nnoremap <Leader>2 :buffer 2<CR>
nnoremap <Leader>3 :buffer 3<CR>
nnoremap <Leader>4 :buffer 4<CR>
nnoremap <Leader>5 :buffer 5<CR>
nnoremap <Leader>6 :buffer 6<CR>
nnoremap <Leader>7 :buffer 7<CR>
nnoremap <Leader>8 :buffer 8<CR>
nnoremap <Leader>9 :buffer 9<CR>

" switch to previous / next buffer
nnoremap <Leader>h :bp<CR>
nnoremap <Leader>l :bn<CR>

" start nerd tree
map <C-n> :NERDTreeToggle<CR>

" reload vim config in-place
nnoremap <Leader>sv :source $MYVIMRC<CR>

" #############################################################################################################
" ############################################################################################### Plugin settings
" #############################################################################################################
" ale linter
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
"let g:ale_linters = {'python': ['flake8', 'mypy'], 'vue': ['eslint', 'vls']}
" let g:ale_linters = {'python': ['pylint', 'mypy'], 'vue': ['eslint', 'vls']}
let g:ale_linters = {'python': ['mypy'], 'vue': ['eslint', 'vls']}
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'python': ['black', 'isort'], 'vue':['prettier', 'eslint']}
let g:ale_sign_error = ''
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1
let g:ale_python_auto_poetry = 1
let g:ale_python_mypy_ignore_invalid_syntax = 0
let g:ale_python_mypy_options = '--namespace-packages'
let g:ale_python_mypy_show_notes = 1
let g:ale_python_mypy_use_global = 0
let g:ale_python_flake8_options = '--max-line-length=88'
let g:ale_python_pylint_options = '--disable=C0114,C0115,C0116,R0903,W0613 --variable-rgx="[a-z0-9_]{1,30}$"'

" YCM YouCompleteMe settings
let g:ycm_server_python_interpreter = '/usr/bin/python'

" colors base16-shell https://github.com/chriskempson/base16-shell
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#buffer_nr_show = 1

" black-nvim (https://github.com/averms/black-nvim)
let g:black#settings = {
    \ 'fast': 1,
    \ 'line_length': 88
\}

" LaTeX Live Previewer options
let g:livepreview_previewer = 'evince'
let g:livepreview_engine = 'lualatex'

" #############################################################################################################
" ############################################################################################### Commands
" #############################################################################################################
" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
        \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
"autocmd FileChangedShellPost *
"\ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

command! PrettyJson :%!python -m json.tool
command! YankPath :let @+=@%
command! YankFullPath :let @+=expand('%:p')
command! MakeTags !git ctags
