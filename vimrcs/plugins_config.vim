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
map <leader>F :FZFMru<CR>


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


"-----------"
" Nerd Tree "
"-----------"

let g:NERDTreeWinPos = "left"
let NERDTreeHijackNetrw=0
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
let NERDTreeQuitOnOpen=1
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

" NERDTree relative line numbers
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber


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


"-----------"
" Gitgutter "
"-----------"

let g:gitgutter_enabled=1
let g:gitgutter_signs=1
let g:gitgutter_map_keys = 0
nnoremap <silent> <leader>j :GitGutterToggle<cr>

" For lightline
function! GitStatus()
    let [a,m,r] = GitGutterGetHunkSummary()
    return printf('+%d ~%d -%d', a, m, r)
endfunction

highlight GitGutterAdd    guifg='green' ctermfg=2
highlight GitGutterChange guifg='yellow' ctermfg=3
highlight GitGutterDelete guifg='red' ctermfg=1


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

" from https://github.com/junegunn/vim-peekaboo/issues/68#issuecomment-622601779
function! CreateCenteredFloatingWindow()
    let width = float2nr(&columns * 0.6)
    let height = float2nr(&lines * 0.6)
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction
let g:peekaboo_window="call CreateCenteredFloatingWindow()"


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


"----------"
" deoplete "
"----------"

let g:deoplete#enable_at_startup = 1

" <TAB>: completion - from https://github.com/Shougo/deoplete.nvim/issues/302
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"


"---------"
" jedi-vim "
"---------"

" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

" remap go to assignment because I want fzf ripgrep in-file search on
" <leader>g
let g:jedi#goto_assignments_command = "<leader>h"
