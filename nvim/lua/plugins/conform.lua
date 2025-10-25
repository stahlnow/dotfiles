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
		-- Debug
		log_level = vim.log.levels.INFO, -- set to DEBUG for verbose output (:ConformInfo)

		-- Define your formatters
		formatters_by_ft = {
			-- NOTE: ruff uses pyproject.toml and if not found ~/.config/ruff/pyproject.toml settings
			-- see https://docs.astral.sh/ruff/configuration/#config-file-discovery
			python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
			javascript = { "prettierd", "prettier", stop_after_first = true }, -- runs whatever it finds first
			html = { "prettierd", "prettier", stop_after_first = true }, -- runs whatever it finds first
			vue = { "prettierd", "prettier", stop_after_first = true }, -- runs whatever it finds first
			lua = { "stylua" },
		},
		-- Set default options
		default_format_opts = {
			lsp_format = "fallback", -- options: never, fallback, prefer, first, last.
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
		-- remember: this can be used with gq + motion, see :help gq
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
