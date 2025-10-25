-- lua/lsp/init.lua

-- Configuration / enabling of lsp servers
-- 1) default lsp config come from nvim-lspconfig plugin (from https://github.com/neovim/nvim-lspconfig)
-- 2) lsp server installation is handled by mason plugin (@see lua/plugins/mason or :Mason)

-- override config for these
require("lsp/basedpyright")
require("lsp/eslint")
require("lsp/html")
require("lsp/lua_ls")
require("lsp/typescript_vue")

-- enable with default config
vim.lsp.enable({ "ruff" })
vim.lsp.enable({ "cssls" })
vim.lsp.enable({ "jsonls" })
vim.lsp.enable({ "gopls" })
