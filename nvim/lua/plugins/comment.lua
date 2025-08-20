return {
   'numToStr/Comment.nvim',
   opts = {
   },
   keys = {
      { "<leader>c", "<Plug>(comment_toggle_linewise_current)", mode = "n", desc = "Toggle comment, usage :help comment.plugmap" },
      { "<leader>c", "<Plug>(comment_toggle_linewise_visual)", mode = "x", desc = "Toggle visual comment, usage :help comment.plugmap" },
   },
}
