-- https://github.com/Robitx/gp.nvim
M = {}

M.config = {
   openai_api_key = { "cat", vim.fn.stdpath('config') .. '/secrets/openai_api_key' },
   -- directory for storing chat files
   -- chat_dir = vim.fn.stdpath("data"):gsub("/$", "") .. "/gp/chats",
   chat_dir = vim.fn.expand('$HOME/ai/nvim/chats'),
}

M.mappings = {
   { "<leader>g", "<cmd>GpChatToggle toggle<cr>", desc = "Toggle Chat" },
   { "<leader>gn", "<cmd>GpChatNew<cr>", desc = "New Chat" },
   { "<leader>gd", "<cmd>GpChatDelete<cr>", desc = "Delete Chat" },
}

return M
