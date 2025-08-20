vim.api.nvim_create_user_command('PrettyJson',
function(opts)
  vim.cmd('%!python -m json.tool --indent 2')
end,
{ nargs = 0, bang = true })

vim.api.nvim_create_user_command('MakeTags',
function(opts)
  vim.cmd('!git ctags')
end,
{ nargs = 0 })

vim.api.nvim_create_user_command('YankBaseName',
function(opts)
  vim.cmd('let @+=@%')
end,
{ nargs = 0 })

vim.api.nvim_create_user_command('YankFullPath',
function(opts)
  vim.cmd('let @+=expand("%:p")')
end,
{ nargs = 0 })

vim.api.nvim_create_user_command("PrintLoadedPackages", function()
  for name, _ in pairs(package.loaded) do
    print(name)
  end
end, {})
