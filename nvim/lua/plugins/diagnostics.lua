-- renders a nice diagnostic window
-- https://github.com/rachartier/tiny-inline-diagnostic.nvim

-- Key mappings (default nvim) as a reminder:
-- ]d = "Go to next diagnostic"
-- [d = "Go to previous diagnostic"

return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	config = function()
		require("tiny-inline-diagnostic").setup({
			preset = "ghost", -- this draws a cute ghost icon next to the text
		})
		vim.diagnostic.config({ virtual_text = false }) -- Disable default virtual text
	end,
}
