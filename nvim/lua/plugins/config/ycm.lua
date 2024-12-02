vim.keymap.set('n', '<leader>i', '<cmd>YcmCompleter GoToType<cr>', { noremap = true  })
vim.keymap.set('n', '<leader>I', '<cmd>YcmCompleter GoToDefinition<cr>', { noremap = true  })

vim.g.ycm_collect_identifiers_from_tags_files = 1 -- Let YCM read tags from Ctags file

vim.g.ycm_use_ultisnips_completer = 0 -- Default 1
vim.g.ycm_seed_identifiers_with_syntax = 0 -- Completion for programming language's keyword
vim.g.ycm_complete_in_comments = 0 -- Completion in comments
vim.g.ycm_complete_in_strings = 0 -- Completion in string

vim.g.ycm_enable_inlay_hints = 0 -- Disable inlay hints
vim.g.ycm_auto_trigger = 0 -- Enable signature help

-- extra conf setup
vim.g.ycm_extra_conf_globlist = {'~/*'}


--[[
INFO: in case i forget about how to make the extra conf file for 'GotToType' etc. functions work with python
create a file .ycm_extra_conf.py inside the python project folder with the following content:

[.ycm_extra_conf.py]

def Settings(**kwargs):  # noqa N802
   return {
       'interpreter_path': 'path/to/the/pypoetry/virtualenvs/pi/pa/po/bin/python',
   }

--]]