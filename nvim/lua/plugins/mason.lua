-- lsp tooling / related mappings
-- https://github.com/mason-org/mason.nvim
-- Usage: :Mason
-- registry: https://mason-registry.dev/registry/list
return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	lazy = false, -- Eager load as recommended
	config = function()
		local mason = require("mason")
		local masonlsp = require("mason-lspconfig")

		mason.setup()

		-- this automatically installs AND enables the lsp server..
		masonlsp.setup({
			ensure_installed = {
				"jsonls",
				"html_lsp",
				"cssls",
				"basedpyright",
				"ruff",
				"ts_ls",
				"vue_ls",
				"vtsls",
				"lua_ls",
				"gopls",
				"eslint",
			},
		})
	end,
}
