-- lua/lsp/html.lua
-- https://github.com/microsoft/vscode-html-languageservice

-- Enable snippet support for completions
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config("html", {
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = { "html", "templ", "htmldjango" }, -- TODO probably a few missing here
	root_markers = { "package.json", ".git" },
	settings = {},
	init_options = {
		provideFormatter = true,
		embeddedLanguages = { css = true, javascript = true },
		configurationSection = { "html", "css", "javascript" },
	},
	capabilities = capabilities,
})

vim.lsp.enable({ "html" })
