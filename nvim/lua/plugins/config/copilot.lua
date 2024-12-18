M = {}

M.config = {
   panel = {
      enabled = false,
      auto_refresh = false,
      keymap = {
         jump_next = "<c-l>",
         jump_prev = "<c-h>",
         accept = "<C-Tab>",
         refresh = "gr",
         open = "<M-cr>"
      },
      layout = {
         position = "bottom", -- | top | left | right
         ratio = 0.4
      },
   },
   suggestion = {
      enabled = true,
      auto_trigger = false,
      hide_during_completion = true,
      debounce = 75,
      keymap = {
         accept = "<C-Tab>",
         accept_word = false,
         accept_line = false,
         next = "<c-l>",
         prev = "<c-h>",
         dismiss = "<esc>",
      },
   },
   filetypes = {
      python = true,
      javscript = true,
      cpp = true,
      faust = false,
      supercollider = false,
      glsl = false,
      yaml = false,
      markdown = false,
      help = false,
      gitcommit = false,
      gitrebase = false,
      hgcommit = false,
      svn = false,
      cvs = false,
      ["."] = false,
   },
   copilot_node_command = 'node', -- Node.js version must be > 18.x
   server_opts_overrides = {},
}

M.mappings = {
   { "<leader>v", "<cmd>Copilot suggestion toggle_auto_trigger<cr>", desc = "Toggle copilot suggestions" },
}

return M
