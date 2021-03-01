"-------------"
" bufExplorer "
"-------------"

let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>


"-----"
" MRU "
"-----"

let MRU_Max_Entries = 400
map <leader>F :MRU<CR>


"-----------"
" YankStack "
"-----------"

let g:yankstack_yank_keys = ['y', 'd']

nmap <C-p> <Plug>yankstack_substitute_older_paste
nmap <C-n> <Plug>yankstack_substitute_newer_paste


"-----"
" FZF "
"-----"

" Inspiration here: https://github.com/zenbro/dotfiles/blob/master/.nvimrc#L220-L264
" And here: https://github.com/euclio/vimrc/blob/master/plugins.vim#L174-L188

" For opening search results
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-v': 'vsplit' }

" Basic FZF
nnoremap <c-f> :Files<CR>

" Find buffer
nnoremap <leader>fb :Buffers<CR>

" Find recent file using https://github.com/pbogut/fzf-mru.vim
nnoremap <leader>fh :FZFMru<CR>

" Find line in any buffer
nnoremap <leader>fl :Lines<CR>

" Find mark
nnoremap <leader>fm :Marks<CR>

" Find comit in current buffer
nnoremap <leader>fc :BCommits<CR>

" Search with ripgrep
" First make rg not include file names in search
" From here: https://github.com/junegunn/fzf/issues/1109
" And here: https://github.com/junegunn/fzf.vim/issues/346
" And here: https://github.com/junegunn/fzf.vim/issues/1051
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', 'ctrl-/'), <bang>0)
nnoremap <leader>g :Rg<CR>

" Search snippets (uses ultisnips)
nnoremap <leader>fs :Snippets<CR>


"----------"
" snipMate "
"----------"

" Support ctrl-j in addition to <tab>
ino <C-j> <C-r>=snipMate#TriggerSnippet()<cr>
snor <C-j> <esc>i<right><C-r>=snipMate#TriggerSnippet()<cr>


"----------"
" Vim grep "
"----------"

let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"-----------"
" Nerd Tree "
"-----------"

let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeHijackNetrw=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
let NERDTreeQuitOnOpen=1
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

" NERDTree relative line numbers
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber

" This still doesn't work properly, causing square brackets
" Using the below instead of vim-nerdtree-syntax-higlighting as the latter causes lag
" This still has issues with rendering square brackets, issue (closed) here: https://github.com/ryanoasis/vim-devicons/issues/215
" NERDTrees File highlighting
" function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
"  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
"  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
" endfunction

" call NERDTreeHighlightFile('md', 'red', 'none', 'red', '#151515')
" call NERDTreeHighlightFile('sql', 'blue', 'none', 'blue', '#151515')
" call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('clj', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('jar', 'red', 'none', 'red', '#151515')

" Changing the NERDTree symbols
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : " ",
    \ "Staged"    : " ",
    \ "Untracked" : "ﱡ ",
    \ "Renamed"   : " ",
    \ "Unmerged"  : " ",
    \ "Deleted"   : " ",
    \ "Dirty"     : " ",
    \ "Clean"     : " ",
    \ "Ignored"   : " ",
    \ "Unknown"   : " "
    \ }


"-------------------------------"
" vim-nerdtree-syntax-highlight "
"-------------------------------"

" Reduce lag by specifying what to colour
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeSyntaxDisableDefaultExactMatches = 1
let g:NERDTreeSyntaxDisableDefaultPatternMatches = 1
let g:NERDTreeSyntaxEnabledExtensions = ['clj', 'html', 'py', 'ipynb', 'json', 'yml', 'yaml', 'sql', 'vim', 'md', 'log'] " enabled extensions with default colors
" let g:NERDTreeSyntaxEnabledExactMatches = ['node_modules', 'favicon.ico'] " enabled exact matches with default colors

" Higlight entire lines
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1


" Define some colours to work with
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

" Customise colours
let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['md'] = s:salmon " sets the color of css files to blue

" let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
" let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

" let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
" let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

" let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
" let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule


"----------------------"
" vim-multiple-cursors "
"----------------------"

" Leaving this here in case I want to add it later
" Should be replaced with https://github.com/mg979/vim-visual-multi as per the repo though

" let g:multi_cursor_use_default_mapping=0

" " Default mapping
" let g:multi_cursor_start_word_key      = '<C-s>'
" let g:multi_cursor_select_all_word_key = '<A-s>'
" let g:multi_cursor_start_key           = 'g<C-s>'
" let g:multi_cursor_select_all_key      = 'g<A-s>'
" let g:multi_cursor_next_key            = '<C-s>'
" let g:multi_cursor_prev_key            = '<C-p>'
" let g:multi_cursor_skip_key            = '<C-x>'
" let g:multi_cursor_quit_key            = '<Esc>'


"--------------"
" surround.vim "
"--------------"

" NB: ({< adds space around, whereas >}) does not
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


"-----"
" Ale "
"-----"

let g:ale_linters = {
\   'python': ['flake8'],
\   'go': ['go', 'golint', 'errcheck']
\}

" Let's hold off on LSPs until there's a real need for them
let g:ale_disable_lsp = 1

" Navigate errors
nmap <silent> <leader>a <Plug>(ale_next_wrap)
nmap <silent> <leader>A <Plug>(ale_previous_wrap)

" " Disabling highlighting
" let g:ale_set_highlights = 0

" " Only run linting when saving the file
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = 0


"-----------"
" Gitgutter "
"-----------"

let g:gitgutter_enabled=1
let g:gitgutter_signs=1
let g:gitgutter_map_keys = 0
" let g:gitgutter_highlight_lines = 1
nnoremap <silent> <leader>j :GitGutterToggle<cr>

" For lightline
function! GitStatus()
    let [a,m,r] = GitGutterGetHunkSummary()
    return printf('+%d ~%d -%d', a, m, r)
endfunction

highlight GitGutterAdd    guifg='green' ctermfg=2
highlight GitGutterChange guifg='yellow' ctermfg=3
highlight GitGutterDelete guifg='red' ctermfg=1

let g:gitgutter_sign_added = ' '
let g:gitgutter_sign_modified = ' '
let g:gitgutter_sign_removed = ' '
" let g:gitgutter_sign_removed_first_line = '^^'
" let g:gitgutter_sign_modified_removed = 'ww'


"------"
" Gist "
"------"

" Ensure gists are private by default
let g:gist_post_private = 1


"---------"
" vimwiki "
"---------"

let g:vimwiki_list = [{'path': '~/workspace/notes/vim-wiki'}]

"--------------"
" vim-peekaboo "
"--------------"

" let g:peekaboo_window="vert abo 30new"

"---------"
" neoterm "
"---------"

nnoremap <leader>tq :exec('T cat % \| bq query --max_rows=10')
nnoremap <leader>td :exec('T cat % \| bq_dry')<CR>
nnoremap <leader>tf :exec('T cat % \| bq query --format=csv --max_rows=1000 > output.csv')
nnoremap <leader>ts <Plug>(neoterm-repl-send)

"-----------"
" UltiSnips "
"-----------"

let g:UltiSnipsExpandTrigger="<c-j>"
