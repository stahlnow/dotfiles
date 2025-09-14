vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = {
					"vim",
					"require",
					"exepath",
				},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true), -- make Neovim API visible
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
})
