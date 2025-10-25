-- lua/lsp/basedpyright
vim.lsp.config("basedpyright", {
	settings = {
		basedpyright = {
			disableOrganizeImports = true,
			analysis = {
				ignore = { "*" }, -- using ruff
				typeCheckingMode = "off", -- "off", "basic", "standard", "strict", "recommended", "all"
				autoImportCompletions = false,
				exclude = { "**/migrations", "**/__pycache__" },
			},
		},
		python = {
			analysis = {
				ignore = { "*" }, -- using ruff
				typeCheckingMode = "off", -- using mypy
			},
		},
	},
})
vim.lsp.enable({ "basedpyright" })
