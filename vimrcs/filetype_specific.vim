"---------"
" Clojure "
"---------"

" Special rules for AutoPair for clojure files - don't include single quotes (') or backticks (`)
au Filetype clojure let b:AutoPairs = {'(':')', '[':']', '{':'}','"':'"', '```':'```', '"""':'"""', "'''":"'''"}


"-----"
" dbt "
"-----"

" Inspiration: https://github.com/jgillies/vim-dbt
" Inspiration: https://github.com/ivanovyordan/dbt.vim
" Inspiration: https://discourse.getdbt.com/t/syntax-highlighting-sql-linting/15/3

au BufNewFile,BufRead *.sql set ft=dbt
