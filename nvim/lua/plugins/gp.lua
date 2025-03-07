-- https://github.com/Robitx/gp.nvim

return {

   "robitx/gp.nvim",

   config = function()

      local gp = require("gp")

      gp.setup({

         openai_api_key = { "cat", vim.fn.stdpath('config') .. '/secrets/openai_api_key' },
         -- directory for storing chat files
         -- chat_dir = vim.fn.stdpath("data"):gsub("/$", "") .. "/gp/chats",
         chat_dir = vim.fn.expand('$HOME/ai/nvim/chats'),

         hooks = {
            -- command which writes unit tests for the selected code
            UnitTests = function(gp, params)
               local template = "I have the following code from {{filename}}:\n\n"
                  .. "```{{filetype}}\n{{selection}}\n```\n\n"
                  .. "Please respond by writing unit tests for the code above using pytest."
               local agent = gp.get_command_agent()
               gp.Prompt(params, gp.Target.enew, agent, template)
            end,

            UnitTestsParametrized = function(gp, params)
               local template = "I have the following code from {{filename}}:\n\n"
                  .. "```{{filetype}}\n{{selection}}\n```\n\n"
                  .. "Please respond by writing parametrized unit tests for the code above using pytest."
               local agent = gp.get_command_agent()
               gp.Prompt(params, gp.Target.enew, agent, template)
            end,

         }
      })

   end,


   keys = {
      { "<leader>gn", "<cmd>GpChatNew<cr>", desc = "New Chat" },
      { "<leader>g", "<cmd>GpChatToggle toggle<cr>", desc = "Toggle Chat" },
      { "<leader>gn", "<cmd>GpChatDelete<cr>", desc = "Delete Chat" },
   },

}
