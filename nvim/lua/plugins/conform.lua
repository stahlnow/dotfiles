-- formatted / fixed / prettier code
-- https://github.com/stevearc/conform.nvim
return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>=",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			python = { "isort", "ruff_fix", "ruff_format" },
			javascript = { "prettierd", "prettier", stop_after_first = true }, -- runs whatever it finds first
			html = { "prettierd", "prettier", stop_after_first = true }, -- runs whatever it finds first
			vue = { "prettierd", "prettier", stop_after_first = true }, -- runs whatever it finds first
			lua = { "stylua" },
		},
		-- Set default options
		default_format_opts = {
			lsp_format = "fallback", -- fallback to LSP to format, if no formatter was found
		},
		-- Set up format-on-save
		format_on_save = { timeout_ms = 500 }, -- cancel, if it takes longer than 500ms
		-- Customize formatters
		formatters = {
			shfmt = {
				append_args = { "-i", "2" }, -- indent 2 spaces
			},
		},
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
