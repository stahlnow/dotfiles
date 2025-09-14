-- after/lsp/eslint.lua
vim.lsp.config("eslint", {
	cmd = { "vscode-eslint-language-server", "--stdio" },
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
	root_markers = {
		".eslintrc",
		".eslintrc.js",
		".eslintrc.json",
		".eslintrc.cjs",
		"eslint.config.js",
		"package.json",
	},
	settings = {
		validate = "on",
		packageManager = "yarn",
		format = { enable = true },
		workingDirectory = { mode = "auto" },
	},
})
