vim.api.nvim_create_autocmd("Filetype", {
  pattern = "python",
  callback = function()
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
  end,
  desc = "Set tab width for Faust files",
})

vim.api.nvim_create_autocmd("Filetype", {
  pattern = "cpp",
  callback = function()
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
  end,
  desc = "Set tab width for Faust files",
})

vim.api.nvim_create_autocmd("Filetype", {
  pattern = "lua",
  callback = function()
    vim.opt.tabstop = 3
    vim.opt.softtabstop = 3
    vim.opt.shiftwidth = 3
    vim.opt.expandtab = true
  end,
  desc = "Set tab width for Faust files",
})

vim.api.nvim_create_autocmd("Filetype", {
  pattern = "faust",
  callback = function()
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
  end,
  desc = "Set tab width for Faust files",
})
