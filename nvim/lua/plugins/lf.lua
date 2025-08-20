return {
   "lmburns/lf.nvim",
   dependencies = {
      "akinsho/toggleterm.nvim",
   },

   opts = {
      border = "single", -- border kind: single double shadow curved rounded
      escape_quit = true, -- map escape to the quit command (so it doesn't go into a meta normal mode)
   },

   keys = {
      { "<leader>e", "<cmd>Lf<cr>", desc = "Start lf file manager", noremap = true },
   },
}
