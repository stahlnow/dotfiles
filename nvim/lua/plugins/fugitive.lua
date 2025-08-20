return {
   -- Git wrapper, usage: :Git status, :help fugitive
   "tpope/vim-fugitive",

   keys = {
      { "<leader>G", "<cmd>Git<cr>", desc = "Git status, usage :help fugitive" },
   },
}
