local scnvim = require 'scnvim'
local map = scnvim.map
local map_expr = scnvim.map_expr

return {
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
