let g:ale_python_auto_pipenv = 1
let g:ale_python_pylint_options = '--rcfile ~/.pytlintrc'
let g:ale_python_flake8_options = '--max-complexity=10 --max-line-length=119 --select=E9,F63,F7,F82'
let g:ale_python_isort_options = '-m3 --tc'
let g:ale_python_black_options = '--skip-string-normalization -l 119'
let b:ale_linters = ['flake8', 'pylint']
let b:ale_fixers =  ['isort', 'black']
