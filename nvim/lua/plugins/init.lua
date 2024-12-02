return {
  -- fuzzy find
  {
    "junegunn/fzf",
    build = "./install --bin",
  },
  {
    "junegunn/fzf.vim",
    opt = require "plugins.config.fzf",
  },

  -- comment
  {
    "tomtom/tcomment_vim",
    opt = require "plugins.config.tcomment",
  },

  -- Tab completion
  "ervandew/supertab",

  {
    "dense-analysis/ale",
    opt = require "plugins.config.ale",
  },

  -- highlight word under cursor with <Leader>k
  {
    "lfv89/vim-interestingwords",
    opt = require "plugins.config.interestingwords",
  },

  "posva/vim-vue",

  "tpope/vim-abolish",

  {
    "ycm-core/YouCompleteMe",
    build = "./install.py --all",
    opt = require "plugins.config.ycm",
  },

  {
    "github/copilot.vim",
    opt = require "plugins.config.copilot",
  },

  -- ChatGPT
  -- https://github.com/Robitx/gp.nvim
  {
    "robitx/gp.nvim",
    config = function()
      local conf = require "plugins.config.gpt"
      require("gp").setup(conf.config)
      conf.setup_mappings()
    end,
  },

  ---------------------------------------------- fancy plugins
  -- lf file manager
  {
    "lmburns/lf.nvim",
    dependencies = { 'akinsho/toggleterm.nvim' },
    opts = require "plugins.config.lf",
  },

  -- Git blame
  {
    "tveskag/nvim-blame-line",
    opt = require "plugins.config.blameline",
  },

  --:Snek     " converts to snake_case               ('foo bar' -> 'foo_bar')
  --:Camel    " converts to CamelCase                ('foo bar' -> 'FooBar')
  --:CamelB   " converts to camelbackCase            ('foo bar' -> 'fooBar')
  --:Kebab    " converts to kebab-case               ('foo bar' -> 'foo-bar')
  --:Screm    " converts to SCREAMING_SNAKE_CASE     ('foo bar' -> 'FOO_BAR')
  "nicwest/vim-camelsnek",

  --:Digraphs        - Search for specific digraph char
  --:UnicodeSearch   - Search for specific Unicode char
  --:UnicodeSearch!  - Search for specific Unicode char (and add at current cursor position)
  --:UnicodeName     - Identify character under cursor (like ga command)
  --:UnicodeTable    - Print Unicode Table in new window
  --:DownloadUnicode - Download (or update) Unicode data
  --:UnicodeCache    - Create cache file Unicode plugin
  "chrisbra/unicode.vim",

  -- Git wrapper
  -- usage: :Git status, :help fugitive
  "tpope/vim-fugitive",

  -- Show git changes
  {
    "airblade/vim-gitgutter",
    opt = require "plugins.config.gitgutter",
  },

  -- Nice statusline  / tabline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = require "plugins.config.lualine",
  },

  "backdround/tabscope.nvim",

  -- icons (for use with vim-airline)
  "ryanoasis/vim-devicons",

  -- Colorizer (:h Colorizer) for visualising color codes like #ff00ff or 'green'
  "chrisbra/Colorizer",

  -- Auto-reload file that changed on disk
  "djoshea/vim-autoread",

  -- Base 16 colorscheme
  "RRethy/nvim-base16",

  -- glsl syntax highlighting for OpenGL Shading Language
  "tikhomirov/vim-glsl",

  -- faust syntax highlighting
  -- https://github.com/gmoe/vim-faust
  "gmoe/vim-faust",

  -- supercollider
  {
    "davidgranstrom/scnvim",
    -- made opts a function cuz scnvim config calls scnvim  module
    -- and we lazyloaded scnvim so we dont want that file to be read on startup!
    opts = function()
      return require "plugins.config.scnvim"
    end,
  }
}
