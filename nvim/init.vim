" #############################################################################################################
" ################################################################################################ Plugin setup
" #############################################################################################################
let g:python3_host_prog = $HOME . '/.local/venv/nvim/bin/python'

" https://github.com/junegunn/vim-plug
" Make sure you use single quotes for Plug
"""""""""""""""""""""""""""""""""""""""""""""" essential plugins
call plug#begin(stdpath('data') . '/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tomtom/tcomment_vim'

" Tab completion
Plug 'ervandew/supertab'

Plug 'dense-analysis/ale'

" highlight word under cursor with <Leader>k
Plug 'lfv89/vim-interestingwords'

Plug 'posva/vim-vue'

Plug 'tpope/vim-abolish'

Plug 'ycm-core/YouCompleteMe'

Plug 'github/copilot.vim'

"""""""""""""""""""""""""""""""""""""""""""""" fancy plugins
" lf file manager <leader>f
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'

" Help fix the ssh copy/paste madness
" Plug 'ojroques/vim-oscyank', {'branch': 'main'}

" Git blame
Plug 'tveskag/nvim-blame-line'

":Snek     " converts to snake_case               ('foo bar' -> 'foo_bar')
":Camel    " converts to CamelCase                ('foo bar' -> 'FooBar')
":CamelB   " converts to camelbackCase            ('foo bar' -> 'fooBar')
":Kebab    " converts to kebab-case               ('foo bar' -> 'foo-bar')
":Screm    " converts to SCREAMING_SNAKE_CASE     ('foo bar' -> 'FOO_BAR')
Plug 'nicwest/vim-camelsnek'

":Digraphs        - Search for specific digraph char
":UnicodeSearch   - Search for specific Unicode char
":UnicodeSearch!  - Search for specific Unicode char (and add at current cursor position)
":UnicodeName     - Identify character under cursor (like ga command)
":UnicodeTable    - Print Unicode Table in new window
":DownloadUnicode - Download (or update) Unicode data
":UnicodeCache    - Create cache file Unicode plugin
Plug 'chrisbra/unicode.vim'

" Git wrapper
" usage: :Git status, :help fugitive
Plug 'tpope/vim-fugitive'

" Lean & mean status/tabline for vim that's light as air.
Plug 'vim-airline/vim-airline'

" icons (for use with vim-airline)
Plug 'ryanoasis/vim-devicons'

" Colorizer (:h Colorizer) for visualising color codes like #ff00ff or 'green'
Plug 'chrisbra/Colorizer'

" Show git changes
Plug 'airblade/vim-gitgutter'

" Auto-reload file that changed on disk
Plug 'djoshea/vim-autoread'

" Base 16 colorscheme
Plug 'RRethy/nvim-base16'

" glsl syntax highlighting for OpenGL Shading Language
Plug 'tikhomirov/vim-glsl'

" faust syntax highlighting
Plug 'gmoe/vim-faust'

" supercollider
Plug 'davidgranstrom/scnvim'


" Initialize plugin system
call plug#end()

" #############################################################################################################
" ############################################################################################### General setup
" #############################################################################################################
" Map space key as <Leader>
nnoremap <SPACE> <Nop>
let mapleader=" "

set clipboard+=unnamedplus              " use clipboard instead of vim registers
set number    				                  " show line numbers
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

set expandtab " On pressing tab, insert space
set tabstop=2 " define width of a <Tab> character
set shiftwidth=2 " determines how many blanks are inserted when using the > and < commands, and when automatic indentation is used. If set to 0, it uses the value of tabstop.
set softtabstop=-1 " Use value of shiftwidth
set smarttab       " Always use shiftwidth
set autoindent
set smartindent

let g:netrw_liststyle=3

filetype plugin on

" set tab width
autocmd FileType cpp    setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType scss   setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yaml   setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType vue    setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType js     setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType ts     setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType faust  setlocal ts=4 sts=4 sw=4 expandtab

" enable project-specific vimrc
" set exrc " exrc allows loading local executing local rc files.
" set secure " secure disallows the use of :autocmd, shell and write commands in local .vimrc files.

" disable continuation of comments
autocmd FileType * set formatoptions-=cro

" see :help ft-python-indent
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
" ################################################################################################ Key mappings
" #############################################################################################################
" remap ^ to 1 to use 1 as 'go to first character of line'
noremap 1 ^

" remap $ to end of line WITHOUT newline (by going one character to the right)
vnoremap $ $h

" <Enter> to insert newline without entering insert mode and staying on same line
nmap <CR> o<Esc>k

" double-<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch <bar> :call UncolorAllWords()<CR><Esc>

" q starts visual block mode
nnoremap q <c-V>

" Paste over without overwriting register
xnoremap <expr> p 'pgv"'.v:register.'y`>'

" toggle paste mode with F2
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" save/update
nnoremap <Leader>s :update<CR>

" quit (checks saved)
nnoremap <Leader>d :bd<CR>

" fore quit
nnoremap <Leader>q :q!<CR>

" copy buffer full path to + register
nnoremap <Leader>~ :let @+=expand('%:p')<CR>

" jump to next/previous change
nnoremap <Leader>n ]c
nnoremap <Leader>p [c

" tcomment_vim
nnoremap <Leader>c :TComment<CR>
xnoremap <Leader>c :TCommentBlock<CR>

" fzf bindings
let g:fzf_action = {
      \ 'ctrl-o': 'tab split',
  \ }
nnoremap <Leader>a :Ag<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>t :Tags<CR>
" nnoremap <Leader>o :Buffers<CR>
" nnoremap <Leader>h :History<CR>

" defined in .zshrc
" let $FZF_DEFAULT_COMMAND='find . \! \( -type d -path ./.git -prune \) \! -type d \! -name ''*.tags'' -printf ''%P\n'''"

" yank line whitespace-trimmed w/o newline
nnoremap <Leader>y _yg_

" use plugin to yank from anywhere (https://github.com/ojroques/vim-oscyank)
" vnoremap <Leader>Y :OSCYank<CR>

" use space + D for delete to black hole register
" nnoremap <Leader>D "_d
" xnoremap <Leader>D "_d

" [r]repeat last command
nnoremap <Leader>r @:

" [i]inspect
nnoremap <leader>i :YcmCompleter GoToType<CR>
nnoremap <Leader>I :YcmCompleter GoToDefinition<CR>

" jump f[o]rward
nnoremap <Leader>o <C-I>
" jump [p]revious
nnoremap <Leader>p <C-O>

" Git [b]blame
nnoremap <silent> <Leader>b :ToggleBlameLine<CR>

" switch to next buffer
nnoremap <Leader>l :bn<CR>
nnoremap <Leader>h :bp<CR>

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

" Map lf https://github.com/ptzz/lf.vim
let g:lf_map_keys = 0
map <Leader>e :Lf<CR>

" reload vim config in-place
nnoremap <Leader>sv :source $MYVIMRC<CR>

" #############################################################################################################
" ############################################################################################# Plugin settings
" #############################################################################################################

lua require('colorschemes')


" interestingwords
nnoremap <silent> <leader>j :call UncolorAllWords()<cr>


" Copilot
let g:copilot_enabled = v:true
let g:copilot_filetypes = {
      \ '*': v:false,
      \ 'python': v:true,
      \ 'javascript': v:true,
      \ 'vue': v:true,
      \ 'faust': v:false,
      \ 'supercollider': v:false,
      \ 'glsl': v:true,
      \ }

" toggle Copilot with <Leader>+\ "
"lua << EOF
"local copilot_on = true
"vim.api.nvim_create_user_command("CopilotToggle", function()
"	if copilot_on then
"		vim.cmd("Copilot disable")
"		print("Copilot OFF")
"	else
"		vim.cmd("Copilot enable")
"		print("Copilot ON")
"	end
"	copilot_on = not copilot_on
"end, { nargs = 0 })
"vim.keymap.set("", "<Leader>\\", ":CopilotToggle<CR>", { noremap = true, silent = true })
"EOF


" YouCompleteME
set completeopt-=preview
" let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
" let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
" let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
" let g:ycm_complete_in_comments = 1 " Completion in comments
" let g:ycm_complete_in_strings = 1 " Completion in string
"
let g:ycm_extra_conf_globlist = ['~/*']

" let g:ycm_language_server = [ {
"     \ 'name': 'vue',
"     \ 'filetypes': [ 'vue' ],
"     \ 'cmdline': [ 'vls'  ]
"     \ } ]

" just in case i forget about how to make 'go to file' work with python
" create a file .ycm_extra_conf.py inside the python project folder with the following content:
"def Settings(**kwargs):  # noqa N802
"    return {
"        'interpreter_path': 'path/to/the/pypoetry/virtualenvs/pi/pa/po/bin/python',
"    }




" ale
" set omnifunc=ale#completion#OmniFunc
" let g:ale_completion_enabled = 1
" let g:ale_completion_autoimport = 0

let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}

let g:ale_linters = {
\  'python': ['ruff'],
\  'vue': ['eslint'],
\  'javascript': ['eslint'],
\  'c': ['clangtidy'],
\  'cpp': ['clangtidy'],
\  'asm': []
\}

let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'python': ['isort', 'black', 'ruff'],
\  'vue': ['prettier', 'eslint'],
\  'javascript': ['prettier', 'eslint'],
\  'cpp': ['clang-format']
\}

let g:ale_sign_error = ''
let g:ale_sign_warning = '⚠️'
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_python_auto_poetry = 1
let g:ale_python_pylint_auto_poetry = 1
let g:ale_python_mypy_ignore_invalid_syntax = 0
let g:ale_python_mypy_options = '--namespace-packages'
let g:ale_python_mypy_show_notes = 1
let g:ale_python_mypy_use_global = 0
" let g:ale_python_flake8_options = '--max-line-length=79'
" let g:ale_python_pylint_options = '--disable=C0114,C0115,C0116,R0903,W0613 --variable-rgx="[a-z0-9_]{1,30}$"'
" let g:ale_python_pylint_options = '--rcfile .pylintrc --variable-rgx="[a-z0-9_]{1,30}$"'
" let g:ale_python_pylint_options = '--variable-rgx="[a-z0-9_]{1,30}$"'
" let g:ale_python_pylint_options = '--rcfile .pylintrc'

let g:ale_cpp_clangtidy_checks = []
let g:ale_cpp_clangtidy_executable = 'clang-tidy'
let g:ale_c_parse_compile_commands=1
let g:ale_cpp_clangtidy_extra_options = ''
let g:ale_cpp_clangtidy_options = ''
let g:ale_set_balloons=1
let g:ale_linters_explicit=1
let g:airline#extensions#ale#enabled=1

" colors base16-shell https://github.com/chriskempson/base16-shell
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_section_b = '' " hide Environment status (VCS information - branch, hunk summary (master), battery level)
let g:airline_section_x = '' " hide filetype
let g:airline_section_y = '' " hide file encoding[fileformat]


" airblade/vim-gitgutter
let g:gitgutter_map_keys = 0 " disable all key mappings


" supercollider
" https://github.com/davidgranstrom/scnvim
lua << EOF
local scnvim = require 'scnvim'
local map = scnvim.map
local map_expr = scnvim.map_expr
scnvim.setup {
  -- 'n', 'i', 'x' stands for normal, insert, visual mode
  keymaps = {
    -- ['<C-i>'] = map('postwin.toggle', {'n', 'i'}),
    ['<CR>'] = map('postwin.toggle'),
    ['<C-l>'] = map('postwin.clear', {'n', 'i'}),
    -- ['<M-e>'] = map('editor.send_line', {'i', 'n'}),
    ['<C-e>'] = {
      map('editor.send_block', {'i', 'n'}),
      map('editor.send_selection', 'x'),
    },
    ['<C-s>'] = map('sclang.hard_stop', {'n', 'x', 'i'}),
    ['<C-k>'] = map('signature.show', {'n', 'i'}),
    ['<leader>i'] = map('sclang.start'),
    ['<leader>r'] = map('sclang.recompile'),
    ['<leader>b'] = map_expr('s.boot'),
    ['<leader>m'] = map_expr('s.meter'),
  },
  editor = {
    highlight = {
      color = 'IncSearch',
    },
  },
  postwin = {
    float = {
      enabled = true,
    },
  },
}
EOF


" ############################################################################################### Commands
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
