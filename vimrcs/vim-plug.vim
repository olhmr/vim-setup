call plug#begin()

Plug 'mileszs/ack.vim'
Plug 'dense-analysis/ale'
Plug 'jlanzarotta/bufexplorer'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kien/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'yegappan/mru'
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'mattn/vim-gist'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'vimwiki/vimwiki'
Plug 'airblade/vim-gitgutter'

" Snipmate
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

" These need to be in order according to nerdtree-git-plugin
Plug 'preservim/nerdtree' |
  \ Plug 'Xuyuanp/nerdtree-git-plugin' |
  \ Plug 'ryanoasis/vim-devicons'

" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

call plug#end()