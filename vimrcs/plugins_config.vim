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


"--------"
" CTRL-P "
"--------"

let g:ctrlp_working_path_mode = 0

" Quickly find and open a file in the current working directory
let g:ctrlp_map = '<C-f>'
map <leader>d :CtrlP<cr>

" Quickly find and open a buffer
map <leader>b :CtrlPBuffer<cr>

" Quickly find and open a recently opened file
map <leader>f :CtrlPMRU<CR>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'


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
\   'javascript': ['jshint'],
\   'python': ['flake8'],
\   'go': ['go', 'golint', 'errcheck']
\}

" Because we want to use CoC for our LSP services
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


"-----"
" CoC "
"-----"

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" This clashes with snipmate, but there should be a way to push snipmate through CoC
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"" Always show the signcolumn, otherwise it would shift the text each time
"" diagnostics appear/become resolved.
"if has("patch-8.1.1564")
"  " Recently vim can merge signcolumn and number column into one
"  set signcolumn=number
"else
"  set signcolumn=yes
"endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
" gd overrides basic behaviour, which is not good
" nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gh <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
" This conflicts with vim-fireplace
" Workaround for now: replace K with <leader>k
nnoremap <silent> <leader>k :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" <leader>f clashes with ctrlp
xmap <leader>y  <Plug>(coc-format-selected)
nmap <leader>y  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" The below also clashes, not going to bother for now
"" Applying codeAction to the selected region.
"" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

"" Remap keys for applying codeAction to the current buffer.
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Look into this

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


"---------"
" vimwiki "
"---------"

let g:vimwiki_list = [{'path': '~/workspace/notes/vim-wiki'}]

"--------------"
" vim-peekaboo "
"--------------"

" let g:peekaboo_window="vert abo 30new"

"-----"
" Ack "
"-----"

" Use the the_silver_searcher if possible (much faster than Ack)
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif

" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Open Ack and put the cursor in the right position
map <leader>g :Ack 

" Display results in cope
map <leader>cc :botright cope<cr>

" Display results in new tab
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg

" Go to next search result
map <leader>n :cn<cr>

" Go the previous search result
" this was <leader>p before, but I prefer this
map <leader>N :cp<cr>

" Make sure that enter is never overriden in the quickfix window
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" Autofold results by filename
let g:ack_autofold_results = 1
