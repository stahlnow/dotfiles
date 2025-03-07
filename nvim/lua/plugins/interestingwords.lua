return {
   "lfv89/vim-interestingwords",

   config = function()
      vim.keymap.set('n', '<leader>j', ':call UncolorAllWords()<cr>', { noremap = true  })
   end,
}
