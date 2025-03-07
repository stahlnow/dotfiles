local o = vim.opt

vim.g.mapleader = " "

-- load python3 faster, i think some plugin wants this..
-- TODO
-- g.python3_host_prog = vim.fs.normalize('~/.local/venv/nvim/bin/python')

o.clipboard:append({ 'unnamedplus' })  -- use clipboard instead of vim registers
o.number    = true          -- show line numbers
o.showmatch = true          -- briefly show the matching bracket {[( when typing )]}
o.matchtime = 2
o.title     = true          -- enable 'title' as window name
o.titlestring = '%t'        -- set filename as title

-- search
o.incsearch = true          -- show search matches as you type
o.ignorecase = true         -- ignore case when searching
o.smartcase  = true         -- ignore case when searching lowercase, but not when searching mixed case

--split
o.splitbelow = true
o.splitright = true

-- completion
-- TODO check
o.completeopt:remove({'preview'})

-- have <Left> and <Right> go across lines
o.whichwrap:append({
  ['<'] = true,
  ['>'] = true,
  ['['] = true,
  [']'] = true,
})

-- backupd and swap
o.backupdir = vim.fn.expand('$HOME/.vim/backup//')
o.directory = vim.fn.expand('$HOME/.vim/swp//')

o.shortmess:append({ A = true })  -- don't show message when an existing swap file is found.

-- use with :find for opening files or b: for jumping to buffers
-- finds (nested) files in subdirectories, can use wildmarks :find *.cpp
o.path:append({ '**' })

-- how :command completed
-- 1st tab:         Complete the longest match and bring up 'wildmenu'
-- Additional tabs: Cycle through the menu
o.wildmenu = true
o.wildmode = "longest:list,full"

-- Indentation
o.expandtab = true        -- On pressing tab, insert space
o.tabstop = 2             -- define width of a <Tab> character

-- determines how many blanks are inserted when using the > and < commands,
-- and when automatic indentation is used. If set to 0, it uses the value of tabstop.
o.shiftwidth = 2

o.softtabstop = -1        -- Use value of shiftwidth
o.smarttab = true         -- Always use shiftwidth
o.autoindent = true
o.smartindent = true

-- simple vimdiff highlight colors
-- TODO not sure this is working
vim.api.nvim_set_hl(0, 'DiffAdd', { cterm=bold, ctermfg=10, ctermbg=17, gui=none, guifg=bg, guibg=Red })
vim.api.nvim_set_hl(0, 'DiffDelete', { cterm=bold, ctermfg=10, ctermbg=17, gui=none, guifg=bg, guibg=Red })
vim.api.nvim_set_hl(0, 'DiffChange', { cterm=bold, ctermfg=10, ctermbg=17, gui=none, guifg=bg, guibg=Red })
vim.api.nvim_set_hl(0, 'DiffText', {  cterm=bold, ctermfg=10, ctermbg=88, gui=none, guifg=bg, guibg=Red })

-- python indenting
-- see :h ft-python-indent
vim.g.python_indent = {
  open_paren = 'shiftwidth()',
  nested_paren = 'shiftwidth()',
  continue = 'shiftwidth()',
  closed_paren_align_last_line = false,
}

-- fenced code highlight
vim.g.markdown_fenced_languages = {'html', 'python', 'lua', 'c', 'cpp', 'asm', 'bash', 'make', 'man', 'rust', 'go', 'typescript', 'javascript', 'django', 'glsl' }
