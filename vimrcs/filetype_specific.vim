"---------"
" Clojure "
"---------"

" Special rules for AutoPair for clojure files - don't include single quotes (') or backticks (`)
au Filetype clojure let b:AutoPairs = {'(':')', '[':']', '{':'}','"':'"', '```':'```', '"""':'"""', "'''":"'''"}

" Rainbow parentheses -- need to set this up
" au BufReadPost,BufNewFile *.clj RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces

