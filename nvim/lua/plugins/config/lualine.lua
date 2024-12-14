-- https://github.com/nvim-lualine/lualine.nvim
local map = vim.keymap.set

-- select buffer by number with <leader>1-9 and <leader>0 for last buffer
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

-- select buffer by number with ctrl+1-9 and ctrl+0 for last buffer
-- would be nice, but I use this in kitty terminal to switch tabs already :/
--[[
map('n', '<c-1>', '<cmd>LualineBuffersJump! 1<cr>', { noremap = true  })
map('n', '<c-2>', '<cmd>LualineBuffersJump! 2<cr>', { noremap = true  })
map('n', '<c-3>', '<cmd>LualineBuffersJump! 3<cr>', { noremap = true  })
map('n', '<c-4>', '<cmd>LualineBuffersJump! 4<cr>', { noremap = true  })
map('n', '<c-5>', '<cmd>LualineBuffersJump! 5<cr>', { noremap = true  })
map('n', '<c-6>', '<cmd>LualineBuffersJump! 6<cr>', { noremap = true  })
map('n', '<c-7>', '<cmd>LualineBuffersJump! 7<cr>', { noremap = true  })
map('n', '<c-8>', '<cmd>LualineBuffersJump! 8<cr>', { noremap = true  })
map('n', '<c-9>', '<cmd>LualineBuffersJump! 9<cr>', { noremap = true  })
map('n', '<c-0>', '<cmd>LualineBuffersJump! $<cr>', { noremap = true  }) -- Jumps to last buffer in buffers component.
--]]


-- add this before you set colorscheme
vim.api.nvim_create_autocmd('ColorScheme', {
   -- add `pattern = "colorscheme name"` if you only want to override for one colorscheme, otherwise omit
   callback = function()
      -- see `:h :highlight`
      vim.cmd.highlight('tabline_lualine_a_buffers_active guibg=#FFFFFF')
      vim.cmd.highlight('lualine_a_buffers_inactive guibg=#000000')
   end
})


return {
   options = {
      icons_enabled = true,
      theme = 'base16',
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
            buffers_color = {
               -- Same values as the general color option can be used here.
               active = { fg='black' },     -- Color for active buffer.
               inactive = { fg='white', bg='black' }, -- Color for inactive buffer.
            },
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
