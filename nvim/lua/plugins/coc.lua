local keyset = vim.keymap.set

function _G.show_docs()
   local cw = vim.fn.expand('<cword>')
   if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
      vim.api.nvim_command('h ' .. cw)
   elseif vim.api.nvim_eval('coc#rpc#ready()') then
      vim.fn.CocActionAsync('doHover')
   else
      vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
   end
end

-- Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

return {
   'neoclide/coc.nvim',
   branch = 'release',
   event = { 'BufReadPre', 'BufNewFile'},
   config = function()
      local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

      -- Use Tab for trigger completion with characters ahead and navigate
      -- NOTE: There's always a completion item selected by default, you may want to enable
      -- no select by setting `"suggest.noselect": true` in your configuration file
      -- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
      -- other plugins before putting this into your config
      keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
      keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

      -- Make <CR> to accept selected completion item or notify coc.nvim to format
      -- <C-g>u breaks current undo, please make your own choice
      keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

      -- Make <K> show documentation
      keyset('n', 'K', '<CMD>lua _G.show_docs()<CR>', { silent = true, remap = false })

      -- Use `[g` and `]g` to navigate diagnostics
      -- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
      keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
      keyset("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})

      -- Go to .. shortcuts
      keyset('n', '<leader>i', '<Plug>(coc-definition)', { silent = true, remap = true })
      keyset('n', '<leader>I', '<Plug>(coc-type-definition)', { silent = true, remap = true })

      -- Symbol renaming
      keyset("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })

      --  Apply the most preferred quickfix action to fix diagnostic on the current line
      keyset("n", "<leader>F", "<Plug>(coc-fix-current)", { silent = true })

      ---@diagnostic disable-next-line: redefined-local
      local opts = {silent = true, nowait = true}

      -- Search workspace symbols
      keyset("n", "<leader>S", ":<C-u>CocList -I symbols<cr>", opts)

   end,
}

