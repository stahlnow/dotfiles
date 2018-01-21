" Vundle setup
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'wincent/command-t'
Plugin 'tpope/vim-fugitive'
Plugin 'ervandew/supertab'
Plugin 'supercollider/scvim'
Plugin 'szw/vim-g'

" plugins from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'

" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

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

" ###################################################################### General setup
syntax on 					" turn on syntax highlighting
set number    				" show line numbers
set autoread 				" auto reload buffer when file modified externally
set hlsearch 				" keep previous search highlighted
set tabstop=4
set clipboard=unnamedplus
set incsearch 				" highlight matches while typing search
set splitbelow
set splitright

" alternate copy/paste shortcuts
" vmap <C-c> "+yi
" vmap <C-x> "+c
" vmap <C-v> c<ESC>"+p
" imap <C-v> <C-r><C-o>+

" Map space key as <leader>
let mapleader=" "

" Make double-<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" provide hjkl movements in Insert mode via the <Alt> modifier key
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l

" Navigate Split Panes
" see Plugin: https://github.com/christoomey/vim-tmux-navigator
" <ctrl-h> => Left
" <ctrl-j> => Down
" <ctrl-k> => Up
" <ctrl-l> => Right
" <ctrl-\> => Previous split


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

" enable mouse
set mouse=a

" Arrows are unvimlike 
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" ####################################################################  NERDTree setup

map <C-n> :NERDTreeToggle<CR> 

" ####################################################################  Command-T setup


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

