return {
   "lfv89/vim-interestingwords",
   config = function()
      vim.g.interestingWordsGUIColors = {'#8CCBEA', '#A4E57E', '#FFDB72', '#82F8CB', '#D55D87', '#FF977B'};
      vim.g.interestingWordsRandomiseColors = true;
      vim.keymap.set('n', '<leader>j', ':call UncolorAllWords()<cr>', { noremap = true  })
   end,
}
