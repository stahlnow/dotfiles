vim.lsp.config("basedpyright", {
	settings = {
		basedpyright = {
			analysis = {
				disableOrganizeImports = true,
				autoImportCompletions = false,
				typeCheckingMode = "standard", -- basic
				exclude = { "**/migrations", "**/__pycache__" },
			},
		},
		-- python = {
		--    analysis = {
		--       -- Ignore all files for analysis to exclusively use Ruff for linting
		--       ignore = { '*' },
		--    },
		-- },
	},
})
