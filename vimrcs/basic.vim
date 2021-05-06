"----------------------"
" Startup optimisation "
"----------------------"

let g:loaded_ruby_provider=0
let g:loaded_python_provider=0
let g:python_host_skip_check=1
let g:python3_host_skip_check=1
let g:python3_host_prog='/Users/olhmr/anaconda3/bin/python3'
let g:node_host_prog='/usr/local/bin/node'


"---------"
" Initial "
"---------"

" Define leader
let mapleader = ","
let maplocalleader = "\\"

" Enable filetype plugins
filetype plugin on
filetype indent on


"----------------------"
" Color and Visibility "
"----------------------"

" Note: for iTerm2 I use gruvbox but with cursor background and cursor
" highlight colours swapped, to prevent cursor from becoming invisible
colorscheme gruvbox " ~/.vim/colors/gruvbox.vim, https://github.com/morhetz/gruvbox

syntax enable " Enable syntax higlighting - seems to be enabled anyway?
set background=dark

" Shell colours
if exists('$TMUX') 
    if has('nvim')
        set termguicolors
    else
        set term=screen-256color 
    endif
endif

" Enabling both number and relative number produces hybrid number
set number
set relativenumber 

" Toggle cursorline
:autocmd InsertEnter * set cul " Enable cursorline when entering insert mode
:autocmd InsertLeave * set nocul " Disable cursorline when existing insert mode

" Set how many lines to keep on the screen when scrolling
set scrolloff=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set nocompatible " For vimwiki
set ruler " Always show position
set cmdheight=1 " Height of command bar
set hidden " Hide buffers when abandoned
set lazyredraw " Don't redraw while executing macros (good performance config)
set showmatch " Show matching brackets when text indicator is over them
set mat=2 " How many tenths of a second to blink when matching brackets
set foldcolumn=0 " Amount of extra margin to the left
set shortmess+=c " Added for CoC to not pass messages to |ins-completion-menu|.
set signcolumn=yes " Always show column to the left
set cc=80 " Add vertical at 80

" Basic tab setup
set expandtab " Use spaces instead of tabs
set smarttab " Be smart when using tabs

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


"---------------------"
" Searching and regex "
"---------------------"

set ignorecase " Ignore case when searching
set smartcase " When searching try to be smart about cases 
set hlsearch " Highlight search results
set incsearch " Makes search act like search in modern browsers
set magic " For regular expressions turn magic on

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Re-map , for backward repeat find
nnoremap \ ,
vnoremap \ ,

" Ignore whitespace in diff
set diffopt+=iwhite
set diffexpr=DiffW()
function DiffW()
  let opt = ""
   if &diffopt =~ "icase"
     let opt = opt . "-i "
   endif
   if &diffopt =~ "iwhite"
     let opt = opt . "-w " " swapped vim's -b with -w
   endif
   silent execute "!diff -a --binary " . opt .
     \ v:fname_in . " " . v:fname_new .  " > " . v:fname_out
endfunction


"---------------"
" Miscellaneous "
"---------------"

set updatetime=250 " Quicker response for things like gitgutter
set history=500 " How many lines of history vim will remember

" Persistent undo (enable undo even after closing buffer)
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

" Enable wildmode
:set wildignorecase
:set wildmode=longest,full " this is worth playing around with

" Ignore compiled files in wildmode
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set encoding=utf8 " Set utf8 as standard encoding
set ffs=unix,dos,mac " Use Unix as the standard file type

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Exit nvim terminal
tnoremap <Esc> <C-\><C-n>

" Copy name of file
nmap ,cs :let @*=expand("%:t")<CR>
nmap ,cl :let @*=expand("%:p")<CR>


" Yank, paste, and delete using system clipboard
noremap <leader>y "+y
noremap <leader>p "+p
noremap <leader>d "+d


"--------------------"
" Reading and Saving "
"--------------------"

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file - doesn't work for neovim
" (useful for handling the permission-denied error)
" command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowritebackup
set nowb
set noswapfile

" Delete trailing white space on save, useful for some filetypes
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee,*.sql,*.yml,*.md :call CleanExtraSpaces()
endif


"---------"
" Windows "
"---------"

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


"------"
" Tabs "
"------"

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


"---------"
" Buffers "
"---------"

" Close current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

" Close all buffers
map <leader>ba :bufdo bd<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
" Changing to useopen only to get better behaviour out of Ack
try
  " set switchbuf=useopen,usetab,newtab
  set switchbuf=useopen
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Quickly open a buffer for scribble
" might remap this to <leader>e, need to check that that does
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
" don't really understand what this does
map <leader>pp :setlocal paste!<cr>


"----------"
" Movement "
"----------"

" Remap VIM 0 to first non-blank character
" This caused such headache not understanding why online suggestions didn't work for me, but now I know I can go to actual start of line with |
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
" These don't work, try to incorporate this instead: https://www.vim.org/scripts/script.php?script_id=1590
"nmap <M-j> mz:m+<cr>`z
"nmap <M-k> mz:m-2<cr>`z
"vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
"vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
"if has("mac") || has("macunix")
"  nmap <D-j> <M-j>
"  nmap <D-k> <M-k>
"  vmap <D-j> <M-j>
"  vmap <D-k> <M-k>
"endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions - check if these are used
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
"function! HasPaste()
"    if &paste
"        return 'PASTE MODE  '
"    endif
"    return ''
"endfunction
"
"
"function! CmdLine(str)
"    call feedkeys(":" . a:str)
"endfunction 
"
"function! VisualSelection(direction, extra_filter) range
"    let l:saved_reg = @"
"    execute "normal! vgvy"
"
"    let l:pattern = escape(@", "\\/.*'$^~[]")
"    let l:pattern = substitute(l:pattern, "\n$", "", "")
"
"    if a:direction == 'gv'
"        call CmdLine("Ack '" . l:pattern . "' " )
"    elseif a:direction == 'replace'
"        call CmdLine("%s" . '/'. l:pattern . '/')
"    endif
"
"    let @/ = l:pattern
"    let @" = l:saved_reg
"endfunction
