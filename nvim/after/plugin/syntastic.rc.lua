vim.g.syntastic_python_checkers = { "flake8" }
vim.g.syntastic_python_mypy_args = "--ignore-missing-imports"
vim.g.syntastic_javascript_checkers = { "eslint" }
vim.g.syntastic_error_symbol = "✗"
vim.g.syntastic_warning_symbol = "!"
vim.g.syntastic_style_warning_symbol = "≈"
vim.g.syntastic_style_error_symbol = "≈"
vim.g.syntastic_always_populate_loc_list = 1

-- let g:syntastic_python_flake8_exec = '/usr/local/bin/python3'
-- let g:syntastic_python_flake8_args = ['--ignore=W0401']
-- let g:syntastic_python_mypy_exe = 'dmypy check --'
-- let g:syntastic_python_mypy_args = ''
-- command! -bar Mypy call g:SyntasticCheck('mypy')
