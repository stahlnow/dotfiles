-- lua/lsp/init.lua
-- configuration / enabling of lsp servers
-- NOTE: lsp server installation is handled by mason plugin (@see lua/plugins/mason)

require("lsp/basedpyright")
require("lsp/eslint")
require("lsp/html")
require("lsp/lua_ls")
require("lsp/typescript_vue")

-- NOTE: following do not have special config
vim.lsp.enable({ "ruff" })
vim.lsp.enable({ "cssls" })
vim.lsp.enable({ "jsonls" })
vim.lsp.enable({ "gopls" })
