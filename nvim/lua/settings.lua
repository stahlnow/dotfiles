local M = {}
local opt = vim.opt
local g = vim.g

function M.settings()
  M.options()
  -- M.window_options()
  M.netrw()
end

function M.options()

  -- use clipboard instead of vim registers
  opt.clipboard:append { 'unnamedplus' }

  opt.number    = true          -- show line numbers

  opt.showmatch = true          -- briefly show the matching bracket {[( when typing )]}
  opt.matchtime = 2

  opt.title     = true          -- enable 'title' as window name
  opt.titlestring = '%t'        -- set filename as title

  opt.ignorecase = true         -- ignore case when searching

  opt.splitbelow = true
  opt.splitright = true

  opt.termguicolors  = true

  -- have <Left> and <Right> go across lines
  o.whichwrap:append {
    ['<'] = true,
    ['>'] = true,
    ['['] = true,
    [']'] = true,
  }

  opt.backupdir = "~/.vim/backup//"
  opt.directory = "~/.vim/swp//"

  opt.shortmess:append { 'A' }  -- don't show message when an existing swap file is found.

  -- use with :find for opening files or b: for jumping to buffers
  -- finds (nested) files in subdirectories, can use wildmarks :find *.cpp
  opt.path:append { '**' }

  -- 1st tab:         Complete the longest match and bring up 'wildmenu'
  -- Additional tabs: Cycle through the menu
  opt.wildmode = "longest:full,full"

  opt.expandtab = true        -- On pressing tab, insert space
  opt.tabstop = 2             -- define width of a <Tab> character
  opt.shiftwidth = 2          -- determines how many blanks are inserted when using the > and < commands, and when automatic indentation is used. If set to 0, it uses the value of tabstop.

  opt.softtabstop = -1        -- Use value of shiftwidth
  opt.smarttab = true         -- Always use shiftwidth
  opt.autoindent = true
  opt.smartindent = true

end


function M.netrw()
  g.netrw_liststyle = 3
  g.netrw_banner    = 0
  g.netrw_winsize   = 25
end

return M
