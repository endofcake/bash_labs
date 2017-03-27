#!/bin/bash
set -euf -o pipefail

echo "Installing vim"
apt-get update && apt-get install -y vim curl

echo "Downloading Monokai colour theme for vim"
monokai="https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim"
curl --silent --location --show-error $monokai --output /usr/share/vim/vim74/colors/monokai.vim

echo "Setting sane global vimrc defaults"
cat << EOL >> /etc/vim/vimrc.local
" Setting some decent VIM settings
syntax on
filetype plugin indent on

" Downloaded from https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim
colorscheme monokai

set showmatch                      " automatically show matching brackets.
set visualbell                     " turn on the "visual bell" instead of error bell
set ruler                          " show the cursor position all the time
set laststatus=2                   " make the last line where the status is two lines deep so you can see status always
set backspace=indent,eol,start     " make that backspace key work the way it should
set nocompatible                   " just to be sure we're not using the old vi mode
set background=dark                " use colours that work well on a dark background
set showmode                       " show the current mode
set number                         " show line numbers

" search settings
set hlsearch                       " highlight all search results
set ignorecase                     " make search case-insensitive by default
set smartcase                      " if a pattern contains an uppercase letter, it is case sensitive, otherwise, it is not
set incsearch                      " enable incremental search

" some opinionated indentation settings
set expandtab                      " insert spaces whenever the tab key is pressed
set tabstop=4                      " 4 spaces per tab
set softtabstop=4                  " number of spaces per tab  in insert mode
set shiftwidth=4                   " number of reindent spaces (<< and >>)
set autoindent                     " auto-indent new lines
set smartindent                    " enable smart-indent
set smarttab                       " enable smart-tabs

" Have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

EOL

echo "Finished setting up vim"
