vim.g.ale_linters = {
  python = {'ruff'},
  vue = {'eslint'},
  javascript = {'eslint'},
  c = {'clangtidy'},
  cpp = {'clangtidy'},
  -- lua = {'luacheck'},
  asm = {},
}

vim.g.ale_linter_aliases = {vue = {'vue', 'javascript'}}

vim.g.ale_fixers = {
  ['*'] = {'remove_trailing_lines', 'trim_whitespace'},
  python = {'isort', 'black', 'ruff'},
  css = {'prettier'},
  scss = {'prettier'},
  javascript = {'prettier', 'eslint'},
  cpp = {'clang-format'},
  vue = {'prettier', 'eslint'},
  html = {'prettier'},
  -- htmldjango = {'prettier'},
  -- lua = {'luafmt'},
}

vim.g.ale_sign_error = ''
vim.g.ale_sign_warning = '⚠️'
vim.g.ale_lint_on_save = 1
vim.g.ale_fix_on_save = 1

-- python
vim.g.ale_python_auto_poetry = 1
vim.g.ale_python_pylint_auto_poetry = 1
vim.g.ale_python_mypy_ignore_invalid_syntax = 0
vim.g.ale_python_mypy_options = '--namespace-packages'
vim.g.ale_python_mypy_show_notes = 1
vim.g.ale_python_mypy_use_global = 0
-- vim.g.ale_python_flake8_options = '--max-line-length=79'
-- vim.g.ale_python_pylint_options = '--disable=C0114,C0115,C0116,R0903,W0613 --variable-rgx="[a-z0-9_]{1,30}$"'
-- vim.g.ale_python_pylint_options = '--rcfile .pylintrc --variable-rgx="[a-z0-9_]{1,30}$"'
-- vim.g.ale_python_pylint_options = '--variable-rgx="[a-z0-9_]{1,30}$"'
-- vim.g.ale_python_pylint_options = '--rcfile .pylintrc'

-- cpp
vim.g.ale_cpp_clangtidy_checks = {}
vim.g.ale_cpp_clangtidy_executable = 'clang-tidy'
vim.g.ale_c_parse_compile_commands=1
vim.g.ale_cpp_clangtidy_extra_options = ''
vim.g.ale_cpp_clangtidy_options = ''
vim.g.ale_set_balloons=1
vim.g.ale_linters_explicit=1
