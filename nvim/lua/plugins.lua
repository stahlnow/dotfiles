local vim = vim
local Plug = vim.fn['plug#']

-- load python3 faster, i think some plugin wants this..
g.python3_host_prog = vim.fs.normalize('~/.local/venv/nvim/bin/python')

vim.call('plug#begin')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tomtom/tcomment_vim'

-- Tab completion
Plug 'ervandew/supertab'

Plug 'dense-analysis/ale'

-- highlight word under cursor with <Leader>k
Plug 'lfv89/vim-interestingwords'

Plug 'posva/vim-vue'

Plug 'tpope/vim-abolish'

Plug 'ycm-core/YouCompleteMe'

Plug 'github/copilot.vim'

---------------------------------------------- fancy plugins
-- lf file manager <leader>f
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm' -- dependency of lf.vim
-- Note: lf.vim should be loaded before vim-floaterm to override vim-floaterm's lf wrapper.

-- Git blame
Plug 'tveskag/nvim-blame-line'

--:Snek     " converts to snake_case               ('foo bar' -> 'foo_bar')
--:Camel    " converts to CamelCase                ('foo bar' -> 'FooBar')
--:CamelB   " converts to camelbackCase            ('foo bar' -> 'fooBar')
--:Kebab    " converts to kebab-case               ('foo bar' -> 'foo-bar')
--:Screm    " converts to SCREAMING_SNAKE_CASE     ('foo bar' -> 'FOO_BAR')
Plug 'nicwest/vim-camelsnek'

--:Digraphs        - Search for specific digraph char
--:UnicodeSearch   - Search for specific Unicode char
--:UnicodeSearch!  - Search for specific Unicode char (and add at current cursor position)
--:UnicodeName     - Identify character under cursor (like ga command)
--:UnicodeTable    - Print Unicode Table in new window
--:DownloadUnicode - Download (or update) Unicode data
--:UnicodeCache    - Create cache file Unicode plugin
Plug 'chrisbra/unicode.vim'

-- Git wrapper
-- usage: :Git status, :help fugitive
Plug 'tpope/vim-fugitive'

-- Show git changes
Plug 'airblade/vim-gitgutter'

-- Lean & mean status/tabline for vim that's light as air.
Plug 'vim-airline/vim-airline'

-- icons (for use with vim-airline)
Plug 'ryanoasis/vim-devicons'

-- Colorizer (:h Colorizer) for visualising color codes like #ff00ff or 'green'
Plug 'chrisbra/Colorizer'

-- Auto-reload file that changed on disk
Plug 'djoshea/vim-autoread'

-- Base 16 colorscheme
Plug 'RRethy/nvim-base16'

-- glsl syntax highlighting for OpenGL Shading Language
Plug 'tikhomirov/vim-glsl'

-- faust syntax highlighting
Plug 'gmoe/vim-faust'

-- supercollider
Plug 'davidgranstrom/scnvim'

vim.call('plug#end')
