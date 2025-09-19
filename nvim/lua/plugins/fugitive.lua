-- git wrapper, usage: :Git status, :help fugitive
-- https://github.com/tpope/vim-fugitive
return {
	"tpope/vim-fugitive",
	keys = {
		{ "<leader>G", "<cmd>Git<cr>", desc = "Git status, usage :help fugitive" },
	},
}
