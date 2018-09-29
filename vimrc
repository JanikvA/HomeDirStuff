"vimrc Janik
set nocompatible

" ### remove if not present ###
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

call vundle#end() 
filetype plugin indent on

imap <C-d> <esc>a<Plug>snipMateNextOrTrigger
smap <C-d> <Plug>snipMateNextOrTrigger

" ### remove if not present ###


:let mapleader = ","

let g:netrw_liststyle= 2 " Change the default style of netrw

noremap <F2>  <Esc>:w<Enter>:!root -l %<Enter>
noremap <F3> <Esc>:w<Enter>:!python %<Enter>
noremap <F4> <Esc>:w<Enter>:!./%<Enter>
noremap <F6> <Esc>:w<Enter>:!pdflatex %<Enter>


inoremap <C-f> {}<Esc>i<Enter><Esc>kA<Enter>

set wildmenu "allows easier use of tab completions, e.g. :e <tab>
set wildmode=list:longest,full

set path+=$PWD/** "adds the current dir and all subdirs to path. Nice for :find
 
set confirm

set smartindent
set pastetoggle=<F5>
set ignorecase
set smartcase
set tabstop=4
set expandtab
set nu
:command W w
:command Q q
:command Wa wa
syntax on
set shiftwidth=4

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

nnoremap <leader>d o<Esc>0istd::cout<<" #### *!*Debug*!* 1 #### "<<std::endl;<Esc>0
nnoremap <leader>r /\*\!\*Debug\*\!\*<Enter>dd
nnoremap <leader>mc ?\/\*<Enter>d/\*\/<Enter>dd
nnoremap <leader>l i<Bslash>begin{<++>}<CR><CR><Bslash>end{<++>}<Esc>3k/<++><Enter>c4l
nnoremap <leader>e <Esc>:e <C-d> "kind of useless after adding leader+f mapping
nnoremap <leader>b <Esc>:b <C-d>
nnoremap <leader>f <Esc>:find <C-d>
" not really nice. find a good plugin
nnoremap <leader>q <Esc>bi"<Esc>ea"<Esc>
nnoremap <space> <Esc>i<space><Esc>l

nnoremap <leader><space> <Esc>/<++><Enter>c4l

inoremap kj <Esc>

"easier window movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Needed to be able to properly map the alt key
execute "set <A-h>=\eh"
execute "set <A-j>=\ej"
execute "set <A-k>=\ek"
execute "set <A-l>=\el"

" provide hjkl movements in Insert mode and Command-line mode via the <Alt> modifier key
noremap! <A-h> <Left>
noremap! <A-j> <Down>
noremap! <A-k> <Up>
noremap! <A-l> <Right>


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

"set tags+=/home/janik/terascale_school/app/solution/tags

"c++ snippet
:iab CPPMAIN 
\#include <iostream><CR>
\<CR>
\using namespace std;<CR>
\<CR>
\<CR>int main(int argc, char** argv)
\<CR>{
\<CR>}<up><tab>

"LaTeX beamer snippet
:iab BEAMER 
\<Bslash>documentclass{beamer}
\<CR><Bslash>usetheme{CambridgeUS}
\<CR><Bslash>usepackage{graphicx}
\<CR><Bslash>usepackage{bm}
\<CR><Bslash>usepackage{subfigure}
\<CR><Bslash>usepackage{appendixnumberbeamer}
\<CR><Bslash>graphicspath{{/afs/desy.de/user/a/ahnenjan/public/Plots/}}
\<CR><Bslash>beamertemplatenavigationsymbolsempty
\<CR>%<Bslash>setbeamertemplate{footline}[frame number]
\<CR>
\<CR><Bslash>title[short title]{Title}
\<CR>%<Bslash>titlegraphic{<Bslash>includegraphics[scale=0.2]{DESY_logo.png}}
\<CR><Bslash>author[Janik von Ahnen (DESY)]{Janik von Ahnen}
\<CR><Bslash>institute[]{Krisztian Peters, Othmane Rifki}
\<CR><Bslash>date[VBF Hinv, <Bslash>today]{VBF Hinv, <Bslash>today}
\<CR>
\<CR><Bslash>begin{document}
\<CR><Bslash>frame{<Bslash>titlepage}
\<CR>%<Bslash>section{Outline}
\<CR>%<Bslash>frame{<Bslash>tableofcontents}
\<CR>
\<CR><Bslash>begin{frame}
\<CR><Bslash>frametitle{<++>}
\<CR><Bslash>begin{itemize}
\<CR><Bslash>item <++>
\<CR><Bslash>end{itemize}
\<CR><Bslash>begin{figure}
\<CR><Bslash>subfigure{<Bslash>includegraphics[width=0.45<Bslash>textwidth]{<++>}}
\<CR><Bslash>subfigure{<Bslash>includegraphics[width=0.45<Bslash>textwidth]{<++>}}
\<CR><Bslash>end{figure}
\<CR><Bslash>end{frame}
\<CR>
\<CR>
\<CR><Bslash>appendix
\<CR><Bslash>begin{frame}
\<CR><tab><Bslash>frametitle{Backup}
\<CR><C-w><Bslash>end{frame}
\<CR><Bslash>end{document}

"Beamer frame snippet
:iab FRAME 
\<CR><Bslash>begin{frame}
\<CR><Bslash>frametitle{<++>}
\<CR><Bslash>begin{itemize}
\<CR><Bslash>item <++>
\<CR><Bslash>end{itemize}
\<CR><Bslash>begin{figure}
\<CR><Bslash>subfigure{<Bslash>includegraphics[width=0.45<Bslash>textwidth]{<++>}}
\<CR><Bslash>subfigure{<Bslash>includegraphics[width=0.45<Bslash>textwidth]{<++>}}
\<CR><Bslash>end{figure}
\<CR><Bslash>end{frame}
