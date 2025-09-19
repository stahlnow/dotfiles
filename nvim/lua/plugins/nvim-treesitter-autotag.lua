-- auto close or rename HTML tags
-- https://github.com/windwp/nvim-ts-autotag
-- Requirements: make sure treesitter is setup with parsers (html, vue markdown, ..)
return {
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		opts = {
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false,
			},
		},
	},
}
