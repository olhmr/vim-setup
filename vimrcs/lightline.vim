" Status line / tabline
" Inspiration here: https://github.com/zenbro/dotfiles/blob/d3f4bd3136aab297191c062345dfc680abb1efac/.nvimrc
" Lightline here: https://github.com/itchyny/lightline.vim

set noshowmode " Don't show -- INSERT -- below lightline

" Set up lightline options
let g:lightline = {
  \ 'colorscheme': 'srcery_drk',
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' },
  \ 'active': {
    \ 'left': [ [ 'mode', 'paste' ],
      \         [ 'readonly', 'fugitive', 'modified', 'gitgutter' ] ],
    \ 'right': [ [ 'percent', 'lineinfo' ],
      \          [ 'fileformat', 'fileencoding', 'filetype' ],
      \          [ 'linter_warnings', 'linter_errors', 'linter_ok' ] ]
  \ },
  \ 'component_function': {
    \ 'fugitive': 'FugitiveHead',
    \ 'gitgutter': 'LightLineGitGutter'
  \ },
  \ 'component_expand': {
    \ 'readonly': 'LightLineReadonly',
    \ 'linter_warnings': 'LightlineLinterWarnings',
    \ 'linter_errors': 'LightlineLinterErrors',
    \ 'linter_ok': 'LightlineLinterOK'
  \ },
  \ 'component_type': {
    \ 'readonly': 'error',
    \ 'linter_warnings': 'warning',
    \ 'linter_errors': 'error',
    \ 'linter_ok': 'ok'
  \ }
\ }

function! LightLineReadonly()
  " This need to be a function to allow expansion and setting colour
  if &readonly
    return "RO"
  else
    return ""
  endif
endfunction

function! LightLineGitGutter()
  let symbols = [
    \ g:gitgutter_sign_added,
    \ g:gitgutter_sign_modified,
    \ g:gitgutter_sign_removed
    \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
        call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction

" Below three from here: https://github.com/statico/dotfiles/blob/45aa1ba59b275ef72d8e5cc98f8d6aa360518e00/.vim/vimrc#L412
function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  return l:counts.total == 0 ? '✓' : ''
endfunction

" From https://github.com/maximbaz/lightline-ale/blob/master/plugin/lightline/ale.vim
augroup lightline#ale
  autocmd!
  autocmd User ALEJobStarted call lightline#update()
  autocmd User ALELintPost call lightline#update()
  autocmd User ALEFixPost call lightline#update()
augroup end
