-- Using vim gf mapping with "@" alias
vim.cmd([[
  setlocal isfname+=@-@
  setlocal includeexpr=substitute(v:fname,'^@\/','src/','')
]])
