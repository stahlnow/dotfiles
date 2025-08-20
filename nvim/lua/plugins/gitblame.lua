return {
   "tveskag/nvim-blame-line",

   config = function()
      local map = vim.keymap.set
      map('n', '<leader>b', ':ToggleBlameLine<cr>', { noremap = true, silent = true })
   end,

}
