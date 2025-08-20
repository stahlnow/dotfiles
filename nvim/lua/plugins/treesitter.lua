return {

   "nvim-treesitter/nvim-treesitter",

   build = ":TSUpdate",

   event = { "BufReadPre", "BufNewFile" },

   dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects"
      -- "windwp/nvim-ts-autotag",
   },

   config = function()
      -- import nvim-treesitter plugin
      local treesitter = require("nvim-treesitter.configs")

      -- configure treesitter
      treesitter.setup({
         -- enable syntax highlighting
         highlight = {
            enable = true,
         },
         -- enable indentation
         indent = { enable = true },
         -- enable autotagging (w/ nvim-ts-autotag plugin)
         autotag = {
            enable = true,
         },

         -- ensure these language parsers are installed
         ensure_installed = {
            "c",
            "cpp",
            "asm",
            "cmake",
            "python",
            "go",
            "json",
            "javascript",
            "typescript",
            "tsx",
            "yaml",
            "html",
            "css",
            "diff",
            "markdown",
            "markdown_inline",
            "graphql",
            "bash",
            "lua",
            "vim",
            "dockerfile",
            "gitignore",
            "query",
            "glsl",
            "faust",
            "disassembly",
         },

         incremental_selection = {
            enable = true,
            keymaps = {
               init_selection = "<C-space>",
               node_incremental = "<C-space>",
               scope_incremental = false,
               node_decremental = "<bs>",
            },
         },
      })
   end,
}
