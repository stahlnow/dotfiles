vim.api.nvim_create_autocmd("Filetype", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" }) -- Avoid auto-commenting new lines
   end,
   desc = "Set formatoptions for all filetypes",
})


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



-- https://vim.fandom.com/wiki/Avoid_scrolling_when_switch_buffers

vim.api.nvim_create_autocmd("BufLeave", {
   pattern = "*",
   callback = function()
   -- vimscript TODO port to lua
      vim.cmd [[
          if !exists("w:SavedBufView")
              let w:SavedBufView = {}
          endif
          let w:SavedBufView[bufnr("%")] = winsaveview()
      ]]
   end,
   desc = "Save current view settings on a per-window, per-buffer basis."
})


--
vim.api.nvim_create_autocmd("BufEnter", {
   pattern = "*",
   callback = function()
   -- vimscript TODO port to lua
      vim.cmd [[
          let buf = bufnr("%")
          if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
              let v = winsaveview()
              let atStartOfFile = v.lnum == 1 && v.col == 0
              if atStartOfFile && !&diff
                  call winrestview(w:SavedBufView[buf])
              endif
              unlet w:SavedBufView[buf]
          endif
      ]]
   end,
   desc = "Restore current view settings."
})
