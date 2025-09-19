--[[ ------------------------------------------------------------
 Avoid auto-commenting new lines
-- ------------------------------------------------------------]]
vim.api.nvim_create_autocmd("Filetype", {
	pattern = "*",
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
	desc = "Set formatoptions for all filetypes",
})

--[[ ------------------------------------------------------------
https://vim.fandom.com/wiki/Avoid_scrolling_when_switch_buffers
-- ------------------------------------------------------------]]
vim.api.nvim_create_autocmd("BufLeave", {
	pattern = "*",
	callback = function()
		-- vimscript TODO port to lua
		vim.cmd([[
          if !exists("w:SavedBufView")
          let w:SavedBufView = {}
          endif
          let w:SavedBufView[bufnr("%")] = winsaveview()
          ]])
	end,
	desc = "Save current view settings on a per-window, per-buffer basis.",
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		-- vimscript TODO port to lua
		vim.cmd([[
          let buf = bufnr("%")
          if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
          let v = winsaveview()
          let atStartOfFile = v.lnum == 1 && v.col == 0
          if atStartOfFile && !&diff
          call winrestview(w:SavedBufView[buf])
          endif
          unlet w:SavedBufView[buf]
          endif
          ]])
	end,
	desc = "Restore current view settings.",
})

--[[ ------------------------------------------------------------
 auto switch relativenumber
-- ------------------------------------------------------------]]
-- Create an autocmd group to manage related autocommands
local number_toggle = vim.api.nvim_create_augroup("number_toggle", { clear = true })
-- Enable relative number in normal mode
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
	group = number_toggle,
	callback = function()
		local mode = vim.api.nvim_get_mode().mode

		if mode ~= "i" then
			vim.wo.relativenumber = true
		end
	end,
})
-- Disable relative number in insert mode or when leaving the buffer
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
	group = number_toggle,
	callback = function()
		vim.wo.relativenumber = false
	end,
})

--[[ ------------------------------------------------------------
 language specific autocommands
-- ------------------------------------------------------------]]
-- format on save using 'conform' plugin (https://github.com/stevearc/conform.nvim)
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- Restore default <CR> in quickfix / location list windows
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "qf" },
	callback = function()
		-- Make <CR> jump to entry in quickfix/location list
		vim.api.nvim_buf_set_keymap(0, "n", "<CR>", "<CR>", { noremap = true, silent = true })
	end,
})

-- following lines define indentation

vim.api.nvim_create_autocmd("Filetype", {
	pattern = "python",
	callback = function()
		vim.opt.tabstop = 4
		vim.opt.softtabstop = 4
		vim.opt.shiftwidth = 4
		vim.opt.expandtab = true
	end,
	desc = "Set tab width for python files",
})

vim.api.nvim_create_autocmd("Filetype", {
	pattern = "html",
	callback = function()
		vim.opt.tabstop = 2
		vim.opt.softtabstop = 2
		vim.opt.shiftwidth = 2
		vim.opt.expandtab = true
	end,
	desc = "Set tab width for html files",
})

vim.api.nvim_create_autocmd("Filetype", {
	pattern = "htmldjango",
	callback = function()
		vim.opt.tabstop = 2
		vim.opt.softtabstop = 2
		vim.opt.shiftwidth = 2
		vim.opt.expandtab = true
	end,
	desc = "Set tab width for django templates files",
})

vim.api.nvim_create_autocmd("Filetype", {
	pattern = "javascript",
	callback = function()
		vim.opt.tabstop = 2
		vim.opt.softtabstop = 2
		vim.opt.shiftwidth = 2
		vim.opt.expandtab = true
	end,
	desc = "Set tab width for javascript files",
})

vim.api.nvim_create_autocmd("Filetype", {
	pattern = "typescript",
	callback = function()
		vim.opt.tabstop = 2
		vim.opt.softtabstop = 2
		vim.opt.shiftwidth = 2
		vim.opt.expandtab = true
	end,
	desc = "Set tab width for typescript files",
})

vim.api.nvim_create_autocmd("Filetype", {
	pattern = "vue",
	callback = function()
		vim.opt.tabstop = 2
		vim.opt.softtabstop = 2
		vim.opt.shiftwidth = 2
		vim.opt.expandtab = true
	end,
	desc = "Set tab width for vue files",
})

vim.api.nvim_create_autocmd("Filetype", {
	pattern = "cpp",
	callback = function()
		vim.opt.tabstop = 4
		vim.opt.softtabstop = 4
		vim.opt.shiftwidth = 4
		vim.opt.expandtab = true
	end,
	desc = "Set tab width for cpp files",
})

vim.api.nvim_create_autocmd("Filetype", {
	pattern = "lua",
	callback = function()
		vim.opt.tabstop = 3
		vim.opt.softtabstop = 3
		vim.opt.shiftwidth = 3
		vim.opt.expandtab = true
	end,
	desc = "Set tab width for lua files",
})

vim.api.nvim_create_autocmd("Filetype", {
	pattern = "faust",
	callback = function()
		vim.opt.tabstop = 4
		vim.opt.softtabstop = 4
		vim.opt.shiftwidth = 4
		vim.opt.expandtab = true
	end,
	desc = "Set tab width for faust files",
})

vim.api.nvim_create_autocmd("Filetype", {
	pattern = "asm",
	callback = function()
		vim.opt.tabstop = 8
		vim.opt.softtabstop = 8
		vim.opt.shiftwidth = 8
		vim.opt.expandtab = false
	end,
	desc = "Set tab width for asm files",
})
