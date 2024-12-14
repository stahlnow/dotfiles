local map = vim.keymap.set
map('n', '<leader>c', ':TComment<cr>', { noremap = true, silent = true })
map('x', '<leader>c', ':TCommentBlock<cr>', { noremap = true, silent = true })
