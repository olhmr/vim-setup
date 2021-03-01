call plug#begin()

Plug 'mileszs/ack.vim'
Plug 'dense-analysis/ale'
Plug 'jlanzarotta/bufexplorer'
Plug 'itchyny/lightline.vim'
Plug 'yegappan/mru'
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'guns/vim-sexp'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dadbod'
Plug 'mattn/vim-gist'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'tpope/vim-surround'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'vimwiki/vimwiki'
Plug 'airblade/vim-gitgutter'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'junegunn/vim-peekaboo'
Plug 'kassio/neoterm'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'kshenoy/vim-signature'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'lepture/vim-jinja'

" These need to be in order according to nerdtree-git-plugin
Plug 'preservim/nerdtree' |
  \ Plug 'Xuyuanp/nerdtree-git-plugin' |
  \ Plug 'ryanoasis/vim-devicons'

" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

call plug#end()
