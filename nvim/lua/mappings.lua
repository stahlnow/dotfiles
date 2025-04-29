local map = vim.keymap.set

-- remap ^ to ! to use 1 as 'go to first character of line'
map('n', '!', '^', { noremap = true })
map('v', '!', '^', { noremap = true })

-- remap $ to end of line WITHOUT newline (by going one character to the right)
-- map('v', '$', '$h', { noremap = true })

-- <Enter> to insert newline without entering insert mode and staying on same line
map('n', '<cr>', 'o<esc>k', { })

-- q starts visual block mode
map('n', 'q', '<c-V>', { noremap = true })

-- paste over without overwriting register
map('x', 'p', 'P', { noremap = true })

-- double-<Esc> clear search highlights and all 'colored' words
map('n', '<esc><esc>', function()
  vim.cmd "nohl"
  vim.cmd "call UncolorAllWords()" -- from plugin lfv89/vim-interestingwords
end,
{ noremap = true }
)

-- map ctrl+4 for scrolling upwards
-- map('n', '<c-4>', 'c-Y', { noremap = true })

-- mappings involving leader key

-- [r]repeat last command
map('n', '<leader>r', '@:', { noremap = true  })

-- save/close/quit
map({'n', 'v'}, '<leader>s', '<cmd>update<cr>', { noremap = true  }) -- save/update
map('n', '<leader>d', '<cmd>bd<cr>', { noremap = true  }) -- remove buffer (checks saved)
map({'n', 'v'}, '<leader>q', '<cmd>q!<cr>', { noremap = true  }) -- force quit

-- copy absolute path of current buffer to + register
-- map('n', '<leader>~', '<cmd>let @+=expand("%:p")<cr>', { noremap = true  })

-- vimdiff: jump to next/previous change
map('n', '<leader>n', ']c', { noremap = true  })
map('n', '<leader>N', '[c', { noremap = true  })

-- yank whole line whitespace-trimmed & w/o newline
-- map('n', '<leader>y', '_yg_', { noremap = true  })

-- Moving around buffers

-- jump f[o]rward
map('n', '<leader>o', '<C-I>', { noremap = true  })

-- jump [p]revious
map('n', '<leader>p', '<C-O>', { noremap = true  })

-- switch to previous / next buffer
map('n', '<leader>l', '<cmd>bn<cr>', { noremap = true  })
map('n', '<leader>h', '<cmd>bp<cr>', { noremap = true  })

-- select buffers (splits)l with ctrl-[hjkl]
map('n', '<c-k>', ':wincmd k<cr>', { noremap = true , silent = true })
map('n', '<c-j>', ':wincmd j<cr>', { noremap = true , silent = true })
map('n', '<c-h>', ':wincmd h<cr>', { noremap = true , silent = true })
map('n', '<c-l>', ':wincmd l<cr>', { noremap = true , silent = true })
