" Using vim gf command with "@" alias
setlocal isfname+=@-@
setlocal includeexpr=substitute(v:fname,'^@\/','src/','')
