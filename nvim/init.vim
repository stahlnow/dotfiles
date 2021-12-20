" vim-plug setup
" https://github.com/junegunn/vim-plug
set nocompatible              " be iMproved, required
filetype off                  " required
call plug#begin(stdpath('data') . '/plugged')
" Make sure you use single quotes for Plug
"""""""""""""""""""""""""""""""""""""""""""""" essential plugins
" Smart auto-indentation for Python
Plug 'vim-scripts/indentpython.vim'

" Rich python syntax highlighting
Plug 'kh3phr3n/python-syntax'

" Syntax checker
Plug 'vim-syntastic/syntastic'

" Python backend for 'syntastic'
Plug 'nvie/vim-flake8'

" Find files with Ctrl+p
Plug 'ctrlpvim/ctrlp.vim'

" NERDTree Ctrl+n
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Nerd Commenter
Plug 'scrooloose/nerdcommenter'

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
Plug 'chriskempson/base16-vim'

" Initialize plugin system
call plug#end()

" ###################################################################### General setup

" Map space key as <leader>
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

" handle vimdiff colorscheme for highlight
"if &diff
    "colorscheme github
"endif
" simple vimdiff highlight
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

set path+=**                
" use with :find for opening files or b: for jumping to buffers
" finds (nested) files in subdirectories, can use wildmarks :find *.cpp
set wildmenu

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" quick save leader + s
noremap <Leader>s :update<CR>
noremap <Leader>q :q<CR>
" reload vim config in-place
noremap <Leader>sv :source $MYVIMRC<CR>

" handle copy/paste
" use yy to copy to system clipboard and use p to paste from system clipboard
set clipboard=unnamedplus
" shortcuts for + clipboard (CLIPBOARD)
noremap <Leader>y "+y
noremap <Leader>p "+p
" shortcuts for * clipboard (PRIMARY, copy on select)
noremap <Leader>Y "*y
noremap <Leader>P "*p

" remap $ to ç to use shift+4 as 'go to end of line'
"noremap ç $
"inoremap ç <c-o>$

" remap ^ to 1 to use 1 as 'go to first character of line'
noremap 1 ^

" enable ctags
" set tags=~/.mytags
command! MakeTags !ctags -R .
" jump to tag with ü
nnoremap ü <C-]>

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

" use space + d / p for delete/paste to black hole register
nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP

" Insert newline without entering insert mode and staying on same line
nmap <CR> o<Esc>k

" Make double-<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" provide hjkl movements in Insert mode via the <Ctrl> modifier key
"inoremap <C-h> <C-o>h
"inoremap <C-j> <C-o>j
"inoremap <C-k> <C-o>k
"inoremap <C-l> <C-o>l

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Quick resize with leader up down left right
noremap <silent> <leader><up> <Esc>:res -5<CR><Esc>
noremap <silent> <leader><down> <Esc>:res +5<CR><Esc>
noremap <silent> <leader><left> <Esc>:vertical res +5<CR><Esc>
noremap <silent> <leader><right> <Esc>:vertical res -5<CR><Esc>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" run last command
noremap <leader>r :!!<cr>

" enable mouse
set mouse=a

" Cursor keys / arrows are unvimlike, disable them

"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
"

" YCM YouCompleteMe settings
let g:ycm_server_python_interpreter = '/usr/bin/python'


" colors base16-shell https://github.com/chriskempson/base16-shell
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif


" ################### jump to keyword by leader+j, keyword prompt: leader+p
" List occurrences of keyword under cursor, and
" jump to selected occurrence.
function! s:JumpOccurrence()
  let v:errmsg = ""
  exe "normal [I"
  if strlen(v:errmsg) == 0
    let nr = input("Which one: ")
    if nr =~ '\d\+'
      exe "normal! " . nr . "[\t"
    endif
  endif
endfunction

" List occurrences of keyword entered at prompt, and
" jump to selected occurrence.
function! s:JumpPrompt()
  let keyword = input("Keyword to find: ")
  if strlen(keyword) > 0
    let v:errmsg = ""
    exe "ilist! " . keyword
    if strlen(v:errmsg) == 0
      let nr = input("Which one: ")
      if nr =~ '\d\+'
        exe "ijump! " . nr . keyword
      endif
    endif
  endif
endfunction

nnoremap <Leader>j :call <SID>JumpOccurrence()<CR>
nnoremap <Leader>p :call <SID>JumpPrompt()<CR>


" ################################################ Powerline setup
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab


" #################################################################### YAML
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" ####################################################################  Python
"
" remove trailing whitespace 
autocmd BufWritePre *.py :%s/\s\+$//e

" PEP8 indentation
au BufNewFile,BufRead *.py:
	\ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" ####################################################################  NERDTree setup

map <C-n> :NERDTreeToggle<CR>

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



" ############################################## LaTeX Live Previewer options
let g:livepreview_previewer = 'evince'
let g:livepreview_engine = 'lualatex'
