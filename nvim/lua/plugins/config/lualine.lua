-- https://github.com/nvim-lualine/lualine.nvim
local map = vim.keymap.set

-- Go to buffer by number
map('n', '<leader>1', '<cmd>LualineBuffersJump! 1<cr>', { noremap = true  })
map('n', '<leader>2', '<cmd>LualineBuffersJump! 2<cr>', { noremap = true  })
map('n', '<leader>3', '<cmd>LualineBuffersJump! 3<cr>', { noremap = true  })
map('n', '<leader>4', '<cmd>LualineBuffersJump! 4<cr>', { noremap = true  })
map('n', '<leader>5', '<cmd>LualineBuffersJump! 5<cr>', { noremap = true  })
map('n', '<leader>6', '<cmd>LualineBuffersJump! 6<cr>', { noremap = true  })
map('n', '<leader>7', '<cmd>LualineBuffersJump! 7<cr>', { noremap = true  })
map('n', '<leader>8', '<cmd>LualineBuffersJump! 8<cr>', { noremap = true  })
map('n', '<leader>9', '<cmd>LualineBuffersJump! 9<cr>', { noremap = true  })
map('n', '<leader>0', '<cmd>LualineBuffersJump! $<cr>', { noremap = true  }) -- Jumps to last buffer in buffers component.

return {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {
      {
        'buffers',
        mode = 2, -- 0: Shows buffer name
        -- 1: Shows buffer index
        -- 2: Shows buffer name + buffer index
        -- 3: Shows buffer number
        -- 4: Shows buffer name + buffer number
        filetype_names = {
          fzf = 'fzf',
        }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )
        symbols = {
          modified = ' ●',      -- Text to show when the buffer is modified
          alternate_file = '#', -- Text to show to identify the alternate file
          directory =  '',     -- Text to show when the buffer is a directory
        },
      },
    },
    lualine_b = {''},
    lualine_c = {''},
    lualine_x = {''},
    lualine_y = {''},
    lualine_z = {'tabs'}
  },
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
