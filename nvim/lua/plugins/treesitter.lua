-- Treesitter is fucking awesome
-- https://github.com/nvim-treesitter/nvim-treesitter
-- main takeaway: very nice syntax highlighting and Ctrl+Space / Backspace to quickly select code
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		-- "windwp/nvim-ts-autotag",
	},
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		-- configure treesitter
		---@diagnostic disable-next-line: missing-fields
		treesitter.setup({
			-- enable syntax highlighting
			highlight = {
				enable = true,
			},
			-- enable indentation
			indent = { enable = true },

			-- ensure these language parsers are installed
			ensure_installed = {
				"c",
				"cpp",
				"asm",
				"cmake",
				"python",
				"go",
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"diff",
				"markdown",
				"markdown_inline",
				"graphql",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"query",
				"glsl",
				"faust",
				"disassembly",
			},

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>", -- Ctrl+Space to increase selection
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>", -- BACKSPACE to decrease selection
				},
			},
		})
	end,
}
