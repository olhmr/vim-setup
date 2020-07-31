" Load vimrc Awesome Version: https://github.com/amix/vimrc
set runtimepath+=~/.vim_runtime

" TODO: merge all the contents of this file into these files
source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim
source ~/.vim_runtime/vimrcs/lightline.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

" Install packages with pathogen
" Should this be somewhere in vim_runtime? 
execute pathogen#infect()

" The below is a trick used to reopen a file as writeable with the same buffer
" It was mapped to :W, but I've removed it because it doesn't work with neovim
" and when it fails it flushes all the changes
" Line 51, .vim_runtime/vimrcs/basic.vim
" execute 'w !sudo tee % > /dev/null' | edit!

" Notes
" I use the gruvbox theme for iTerm2, but I've swapped the cursor background and cursor highlight colours - otherwise the cursor becomes almost invisible

set number " Enabling both number and relativenumber produces hybrid number
set relativenumber 
set updatetime=250 " mainly to get git gutter to not wait 4 seconds to update the status bar
:autocmd InsertEnter * set cul " enable cursorline when entering insert mode
:autocmd InsertLeave * set nocul " disable cursorline when existing insert mode

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

"-------------"
" Keybindings "
"-------------"

" Keybinding for going into :Goyo with some additionals
nnoremap <silent> <leader>z :Goyo <bar> :set number <bar> :set relativenumber<CR>

" Exit nvim terminal
tnoremap <Esc> <C-\><C-n>

" Special rules for AutoPair for clojure files - don't include single quotes (') or backticks (`)
au Filetype clojure let b:AutoPairs = {'(':')', '[':']', '{':'}','"':'"', '```':'```', '"""':'"""', "'''":"'''"}

" Re-map , for backward repeat find
nnoremap \ ,
vnoremap \ ,

"-------------"

" Rainbow parentheses
au BufReadPost,BufNewFile *.clj RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Ensure gists are private by default
let g:gist_post_private = 1

" NERDTree relative line numbers
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber

" Using the below instead of vim-nerdtree-syntax-higlighting as the latter causes lag
" This still has issues with rendering square brackets, issue (closed) here: https://github.com/ryanoasis/vim-devicons/issues/215
" NERDTrees File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('md', 'red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('sql', 'blue', 'none', 'blue', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('clj', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('jar', 'red', 'none', 'red', '#151515')

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

" Colour scheme
colorscheme gruvbox

" Git Gutter setup
let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1
" let g:gitgutter_highlight_lines = 1
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

" " This is to solve an issue with brackets around the nerdtree icons (supposedly - doesn't seem to fix it for me)
" if exists("g:loaded_webdevicons")
" 	call webdevicons#refresh()
" endif

" CoC Setup: https://github.com/neoclide/coc.nvim
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" This clashes with snipmate, but I don't really use snipmate anyway
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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
" Also clashes
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
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

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
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

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
