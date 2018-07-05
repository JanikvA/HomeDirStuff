"vimrc Janik
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
call vundle#end() 
filetype plugin indent on
:let mapleader = ","

inoremap <F2>  <Esc>:w<Enter>:!root -l %<Enter>
noremap <F2>  <Esc>:w<Enter>:!root -l %<Enter>

inoremap <F3> <Esc>:w<Enter>:!python %<Enter>
noremap <F3> <Esc>:w<Enter>:!python %<Enter>

inoremap <F4> <Esc>:w<Enter>:!g++ -o %:t:r.out %<Enter> :!./%:t:r.out<Enter>
noremap <F4> <Esc>:w<Enter>:!g++ -o %:t:r.out %<Enter> :!./%:t:r.out<Enter>

noremap <F6> <Esc>:w<Enter>:!pdflatex %<Enter>
"inoremap <leader><space> <Esc>/<++><Enter>c4l
noremap <leader><space> <Esc>/<++><Enter>c4l

imap <C-f> <Enter>{<Enter>}<Esc>kA<Enter>

set smartindent
set pastetoggle=<F5>
set ignorecase
set smartcase
set tabstop=4
"set expandtab
set nu
:command W w
:command Wa wa
syntax on
set shiftwidth=4

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

nnoremap <leader>d o<Esc>0istd::cout<<" #### *!*Debug*!* 1 #### "<<std::endl;<Esc>0
nnoremap <leader>r /\*\!\*Debug\*\!\*<Enter>dd
nnoremap <leader>mc ?\/\*<Enter>d/\*\/<Enter>dd

inoremap kj <Esc>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

:iab CPPMAIN 
\#include <iostream><CR>
\<CR>
\using namespace std;<CR>
\<CR>
\<CR>int main(int argc, char** argv)
\<CR>{
\<CR>}<up><tab>

"set tags+=/home/janik/terascale_school/app/solution/tags

