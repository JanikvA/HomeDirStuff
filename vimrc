"vimrc Janik
set nocompatible
:let mapleader = ","

inoremap <F2>  <Esc> :w <Enter> :!root -l % <Enter>
noremap <F2>  <Esc> :w <Enter> :!root -l % <Enter>

inoremap <F3> <Esc> :w <Enter> :!python % <Enter>
noremap <F3> :w <Enter> :!python % <Enter>

inoremap <F4> <Esc>:w<Enter>:!g++ %<Enter> :!./a.out<Enter>
noremap <F4> <Esc>:w<Enter>:!g++ %<Enter> :!./a.out<Enter>

"inoremap <leader><space> <Esc>/<++><Enter>c4l
noremap <leader><space> <Esc>/<++><Enter>c4l

imap <C-f> <Enter>{<Enter>}<Esc>kA<Enter>

set smartindent
set pastetoggle=<F5>
set ignorecase
set smartcase
set tabstop=4
set expandtab
set nu
:command W w
syntax on
set shiftwidth=4

nnoremap <leader>d o<Esc>0icout<<" #### *!*Debug*!* 1 #### "<<endl;<Esc>0
nnoremap <leader>r /\*\!\*Debug\*\!\*<Enter>dd

inoremap kj <Esc>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

:iab CPPMAIN 
\#include <iostream><CR>
\<CR>
\using namespace std;<CR>
\<CR>
\<CR>int main(int argc, char** argv)
\<CR>{
\<CR>}<up><tab>

