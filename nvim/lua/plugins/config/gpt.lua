-- https://github.com/Robitx/gp.nvim
M = {}

M.config = {
   openai_api_key = { "cat", vim.fn.stdpath('config') .. '/secrets/openai_api_key' },
}

M.setup_mappings = function()

   local function keymapOptions(desc)
       return {
           noremap = true,
           silent = true,
           nowait = true,
           desc = "GPT prompt " .. desc,
       }
   end

   local map = vim.keymap.set

   map("n", "<leader>g", "<cmd>GpChatToggle toggle<cr>", keymapOptions("Toggle Chat"))

end

return M
