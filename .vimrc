" This file should contain minimal config.
" Almost everything should be pushed to one of the sourced files.
" Exceptions for package loading, which should happen after files are sourced.

" Source parts of setup
source ~/workspace/dotfiles/vimrcs/basic.vim
source ~/workspace/dotfiles/vimrcs/lightline.vim
source ~/workspace/dotfiles/vimrcs/plugins_config.vim
source ~/workspace/dotfiles/vimrcs/filetype_specific.vim
source ~/workspace/dotfiles/vimrcs/vim-plug.vim

" Install packages with pathogen: https://github.com/tpope/vim-pathogen
execute pathogen#infect()
call pathogen#helptags()

" don't remember what these do
"let &t_SI = "\e[6 q"
"let &t_EI = "\e[2 q"
