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
	lazy = false, -- eager load
	config = function()
		local mason = require("mason")
		local masonlsp = require("mason-lspconfig")

		mason.setup()

		-- NOTE: most lsp configuration come from neovim/nvim-lspconfig plugin dependency
		-- see: https://github.com/neovim/nvim-lspconfig

		-- masonlsp helps auto-installing servers
		-- and i keep masonlsp mainly for the few extra configs it has:
		-- see https://github.com/mason-org/mason-lspconfig.nvim/tree/main/lua/mason-lspconfig/lsp

		masonlsp.setup({
			-- NOTE: we explicitly enable plugins in lua/lsp/init
			automatic_enable = false,

			-- NOTE 1: this list does NOT include the 'manually' installed tools
			-- via :MasonInstall, so check :Mason for installed tools

			-- NOTE 2: auto install some servers USE CAREFULLY FOR THE FOLLOWING
			-- REASON: Unexpected side effects when using auto-format on save (ie.
			-- using the 'conform' plugin) can happen as all of the following
			-- tools are available GLOBALLY for neovim (and not package.json based
			-- as you would expect!). This can lead to the problem, that a
			-- 'auto-format' is applied that is in conflict with repository-based
			-- tools. For example: repository has eslint configured, but not
			-- prettier. When prettier tool is installed here (globally),
			-- 'conform' plugin applies 'prettier' default formatting, which in
			-- term (may) conflict with eslint config.

			-- TLDR; do not install prettier globally

			ensure_installed = {
				"jsonls",
				"html",
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
