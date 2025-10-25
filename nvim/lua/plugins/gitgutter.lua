-- A Vim plugin which shows git diff markers in the sign column and stages/previews/undoes hunks and partial hunks.
-- https://github.com/airblade/vim-gitgutter
-- Usage:
-- TODO
-- <Leader>hp [h]unk [p]review
-- <Leader>hu [h]unk [u]ndo
return {
	"airblade/vim-gitgutter",
	config = function()
		vim.g.gitgutter_map_keys = 0 -- reset all key mappings
	end,
}
