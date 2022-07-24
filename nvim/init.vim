" vim-plug setup
" https://github.com/junegunn/vim-plug
set nocompatible              " be iMproved, required
filetype off                  " required

" must be before Plug 'averms/black-nvim' ....
let g:python3_host_prog = $HOME . '/.local/venv/nvim/bin/python'

call plug#begin(stdpath('data') . '/plugged')
" Make sure you use single quotes for Plug
"""""""""""""""""""""""""""""""""""""""""""""" essential plugins
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'posva/vim-vue'

Plug 'tpope/vim-sleuth'

" Find files with Ctrl+p
Plug 'ctrlpvim/ctrlp.vim'

" NERDTree Ctrl+n
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Nerd Commenter
Plug 'scrooloose/nerdcommenter'

" Help fix the copy/paste madness
Plug 'ojroques/vim-oscyank', {'branch': 'main'}

"""""""""""""""""""""""""""""""""""""""""""""" tmux related plugins
" vim-tmux-navigator
" Navigate Split Panes
" see Plugin: https://github.com/christoomey/vim-tmux-navigator
" <ctrl-h> => Left
" <ctrl-j> => Down
" <ctrl-k> => Up
" <ctrl-l> => Right
" <ctrl-\> => Previous split
Plug 'christoomey/vim-tmux-navigator'

" in tmux
" FocusGained and FocusLost autocommand events are not working in terminal
" vim. This plugin restores them when using vim inside Tmux. In tmux,
" requires tmux-sensible plugin or "set -g focus-events on"
Plug 'tmux-plugins/vim-tmux-focus-events'

"""""""""""""""""""""""""""""""""""""""""""""" Fancy plugins
" Linter
Plug 'dense-analysis/ale'

" Git blame
Plug 'tveskag/nvim-blame-line'

" Unicode plugin
Plug 'chrisbra/unicode.vim'

" Awesome staring screen for Vim
Plug 'mhinz/vim-startify'

" Git wrapper
" usage: :Gstatus, :Gedit, :Gsplit, :Gvsplit
Plug 'tpope/vim-fugitive'

Plug 'ervandew/supertab'

"Plug 'vim-airline/vim-airline'

" Colorizer for visualising color codes like #ff00ff or 'green'
Plug 'chrisbra/Colorizer'

" Show git changes
Plug 'airblade/vim-gitgutter'

" Auto-reload file that changed on disk
Plug 'djoshea/vim-autoread'

" Base 16 colorscheme
"Plug 'chriskempson/base16-vim'
Plug 'RRethy/nvim-base16'

" Black for python (https://github.com/averms/black-nvim)
Plug 'averms/black-nvim', {'do': ':UpdateRemotePlugins'}

" Initialize plugin system
call plug#end()

" ###################################################################### General setup

" Map space key as <Leader>
nnoremap <SPACE> <Nop>
let mapleader=" "

syntax on 					" turn on syntax highlighting
filetype plugin indent on   " enable plugins
set number    				" show line numbers
set autoread 				" auto reload buffer when file modified externally
set hlsearch 				" keep previous search highlighted
set incsearch 				" highlight matches while typing search
set ignorecase
set splitbelow
set splitright
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

set shortmess+=A            " don't show message when an existing swap file is found.

" simple vimdiff highlight
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

set path+=**                
" use with :find for opening files or b: for jumping to buffers
" finds (nested) files in subdirectories, can use wildmarks :find *.cpp
set wildmenu

"set tabstop=4 " show existing tab with 4 spaces width
"set shiftwidth=4 " number of spaces to use for auto indent
"set expandtab " On pressing tab, insert 4 spaces
"set autoindent " copy indent from current line when starting a new line

nnoremap <Leader>s :update<CR>
nnoremap <Leader>d :bd<CR>
nnoremap <Leader>q :q!<CR>
" run last command
nnoremap <leader>r :!!<cr>

" reload vim config in-place
nnoremap <Leader>sv :source $MYVIMRC<CR>

" fzf bindings
nnoremap <Leader>a :Ag<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>t :Tags<CR>


" handle copy/paste
" use yy to copy to system clipboard and use p to paste from system clipboard
set clipboard+=unnamedplus
" paste over without overwriting register
xnoremap <expr> p 'pgv"'.v:register.'y`>' 

" remap ^ to 1 to use 1 as 'go to first character of line'
noremap 1 ^

" generate ctags
command! MakeTags !git ctags

" F2 sets paste mode
" Start insert mode.
" Press F2 (toggles the 'paste' option on).
" Use your terminal to paste text from the clipboard.
" Press F2 (toggles the 'paste' option off).
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" q starts visual block mode
nnoremap q <c-V>

" use space + D for delete to black hole register
nnoremap <leader>D "_d
xnoremap <leader>D "_d


nnoremap <silent> <leader>b :ToggleBlameLine<CR>

" Insert newline without entering insert mode and staying on same line
nmap <CR> o<Esc>k

" Make double-<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Quick resize with leader up down left right
nnoremap <silent> <leader><up> <Esc>:res -5<CR><Esc>
nnoremap <silent> <leader><down> <Esc>:res +5<CR><Esc>
nnoremap <silent> <leader><left> <Esc>:vertical res +5<CR><Esc>
nnoremap <silent> <leader><right> <Esc>:vertical res -5<CR><Esc>

" Go to tab by number
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 :tablast<cr>

" enable mouse
set mouse=a

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
            \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
"autocmd FileChangedShellPost *
  "\ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None


" easy buffer switching
:nnoremap <F5> :buffers<CR>:buffer<Space>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom functions 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pretty print json"
command PrettyJson :%!python -m json.tool

command YankPath :let @+=@%
command YankFullPath :let @+=expand('%:p')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings and other special functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" linter
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {'vue': ['eslint', 'vls']}
let g:ale_fixers = {'vue':['prettier', 'eslint']}
let g:ale_sign_error = '🥵'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1

" https://github.com/ctrlpvim/ctrlp.vim
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|env\|venv\|build'

" YCM YouCompleteMe settings
let g:ycm_server_python_interpreter = '/usr/bin/python'


" colors base16-shell https://github.com/chriskempson/base16-shell
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif


" ################################################ Powerline setup
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab

" #################################################################### SCSS
autocmd FileType scss setlocal ts=2 sts=2 sw=2 expandtab
" #################################################################### YAML
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" ####################################################################  Python
"
" Black settings (https://github.com/averms/black-nvim)
let g:black#settings = {
    \ 'fast': 1,
    \ 'line_length': 79 
\}

" autocmd BufWritePre *.py execute ':call Black()'

" remove trailing whitespace 
"autocmd BufWritePre *.py :%s/\s\+$//e

" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" PEP8 indentation
"au BufNewFile,BufRead *.py:
	"\ set tabstop=4
    "\ set softtabstop=4
    "\ set shiftwidth=4
    "\ set textwidth=79
    "\ set expandtab
    "\ set autoindent
    "\ set fileformat=unix

" ####################################################################  NERDTree setup

map <C-n> :NERDTreeToggle<CR>

" ####################################################################  NERDCommenter setup
" hook for vue files
let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction


" ############################################## LaTeX Live Previewer options
let g:livepreview_previewer = 'evince'
let g:livepreview_engine = 'lualatex'

" ######################################################################### SCVim setup
let g:sclangTerm = "urxvt"
let g:scFlash = 1

au Filetype supercollider nmap <F3> :call SCfindArgs()<CR>
au Filetype supercollider nmap <buffer> <F2> :call SClangRecompile()<CR>
au Filetype supercollider imap <buffer> <F2> call SClangRecompile()<CR>a
au Filetype supercollider vmap <buffer> <F2> :call SClangRecompile()<CR>
au Filetype supercollider nmap <buffer> <F9> :call SClangStart()<CR>
au Filetype supercollider imap <buffer> <F9> call SClangStart()<CR>a
au Filetype supercollider vmap <buffer> <F9> :call SClangStart()<CR>
au Filetype supercollider nmap <buffer> <F10> :call SClangKill()<CR>
au Filetype supercollider imap <buffer> <F10> call SClangKill()<CR>a
au Filetype supercollider vmap <buffer> <F10> :call SClangKill()<CR>
" make F keys work in insert mode
au Filetype supercollider imap <buffer> <F2> <ESC><F2>i
au Filetype supercollider imap <buffer> <F5> <ESC><F5>i
au Filetype supercollider imap <buffer> <F6> <ESC><F6>i
au Filetype supercollider imap <buffer> <F9> <ESC><F9>i
au Filetype supercollider imap <buffer> <F10> <ESC><F10>i
au Filetype supercollider imap <buffer> <F12> <ESC><F12>i

" ######################################################################################
" Add numbers to tabs

set showtabline=2  " 0, 1 or 2; when to use a tab pages line
set tabline=%!MyTabLine()  " custom tab pages line
function! MyTabLine()
  let s = '' " complete tabline goes here
  " loop through each tab page
  for t in range(tabpagenr('$'))
    " set highlight for tab number and &modified
    let s .= '%#TabLineSel#'
    " set the tab page number (for mouse clicks)
    let s .= '%' . (t + 1) . 'T'
    " set page number string
    let s .= t + 1 . ':'
    " get buffer names and statuses
    let n = ''  "temp string for buffer names while we loop and check buftype
    let m = 0  " &modified counter
    let bc = len(tabpagebuflist(t + 1))  "counter to avoid last ' '
    " loop through each buffer in a tab
    for b in tabpagebuflist(t + 1)
      " buffer types: quickfix gets a [Q], help gets [H]{base fname}
      " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
      if getbufvar( b, "&buftype" ) == 'help'
        let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
      elseif getbufvar( b, "&buftype" ) == 'quickfix'
        let n .= '[Q]'
      else
        let n .= pathshorten(bufname(b))
      endif
      " check and ++ tab's &modified count
      if getbufvar( b, "&modified" )
        let m += 1
      endif
      " no final ' ' added...formatting looks better done later
      if bc > 1
        let n .= ' '
      endif
      let bc -= 1
    endfor
    " add modified label [n+] where n pages in tab are modified
    if m > 0
      let s .= '[' . m . '+]'
    endif
    " select the highlighting for the buffer names
    " my default highlighting only underlines the active tab
    " buffer names.
    if t + 1 == tabpagenr()
      let s .= '%#TabLine#'
    else
      let s .= '%#TabLineSel#'
    endif
    " add buffer names
    let s .= n
    " switch to no underlining and add final space to buffer list
    let s .= '%#TabLineSel#' . ' '
  endfor
  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'
  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLineFill#%999Xclose'
  endif
  return s
endfunction

