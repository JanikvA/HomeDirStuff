"vimrc Janik
let mapleader = ","
set nocompatible
set statusline=
" ### remove if not present ###
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
" Plugin 'garbas/vim-snipmate'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
" Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-commentary'
Plugin 'easymotion/vim-easymotion'

" Plugin 'terryma/vim-multiple-cursors'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'nathanaelkane/vim-indent-guides'

" Plugin 'airblade/vim-gitgutter'

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/gv.vim' " :GV will open commit browser

Plugin 'christoomey/vim-tmux-navigator'

Plugin 'lervag/vimtex'
Plugin 'junegunn/goyo.vim'
" Plugin 'scrooloose/syntastic'
call vundle#end() 
filetype plugin indent on

" goyo
map ög :Goyo<CR>

" vimtex
let maplocalleader = ","

" fzf
" If installed using git
set rtp+=~/.fzf
nnoremap <C-p> :FZF<CR>
nnoremap <C-b> :Buffers<CR>
function! CompletionSource(prefix)
  return 'git ls-files | xargs cat'
endfunction
inoremap <expr> <c-x><c-k> fzf#complete({'source': function('CompletionSource')})

"vim-gitgutter
" let g:gitgutter_map_keys = 0 " to disable all gitgutter mappings
" nnoremap <leader>hn <Plug>GitGutterNextHunk
" nnoremap <leader>hp <Plug>GitGutterPrevHunk
" nnoremap <Leader>ha <Plug>GitGutterStageHunk
" nnoremap <Leader>hr <Plug>GitGutterUndoHunk
" nnoremap <Leader>gghl :GitGutterLineHighlightsToggle<CR>
" nnoremap <Leader>ggt :GitGutterToggle<CR>
" set updatetime=100 "[ms] default is 4000 ms i.e 4s

" vim-airline
" let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#tabline#enabled = 1

" Comment out next 2 lines to show current git branch. makes vim slow if
" working with mount
let g:airline_section_b = '%-0.10{getcwd()}'
let g:airline_section_c = '%t'

let g:airline_section_error=''
let g:airline_section_warning=''
let g:airline_solarized_bg='dark'

"YouCompleteMe
" uncomment the following to activate syntax checking in c++ files
" let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
set completeopt-=preview

""syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" nnoremap <leader>cs :SyntasticCheck<CR>
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" let g:syntastic_python_checkers = ['pylint']  "" or ['flake8', 'pylint'], etc
" let g:syntastic_python_pylint_args = '-E'
" let g:syntastic_quiet_messages = {
"         \ "!level":  "errors",
"         \ "type":    "style",
"         \ "regex":   '.*',
"         \ "file:p":  '.*' }

" easymotion
let g:EasyMotion_do_mapping = 1 " Disable default mappings
map <leader> <Plug>(easymotion-prefix)
let g:EasyMotion_smartcase = 1


"fugitive
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
set diffopt+=vertical

"tagbar
nmap <leader>c :TagbarToggle<CR>

"ctrlpvim
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_by_filename = 1
" nnoremap <c-b> :CtrlPBuffer<CR>

set wildignore+=*/.pyc/*,*/.swp/*,*/.root/*,*/.so/*

"scrooloose/nerdtree
map <C-e> :NERDTreeToggle<CR>

"garbas/vim-snipmate
" imap <C-a> <esc>a<Plug>snipMateNextOrTrigger
" smap <C-a> <Plug>snipMateNextOrTrigger

" UltiSnips
let g:UltiSnipsExpandTrigger="<C-a>"
let g:UltiSnipsJumpForwardTrigger="<C-n>"
let g:UltiSnipsJumpBackwardTrigger="<C-p>"

" ### remove if not present ###

"function! GitBranch()
"  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
"endfunction
"
"function! StatuslineGit()
"  let l:branchname = GitBranch()
"  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
"endfunction
"set statusline+=%#PmenuSel#
"set statusline+=%{StatuslineGit()}


"set statusline+=%{FugitiveStatusline()} "Slows stuff down when working on
"mounted dust
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
"set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
"set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

set laststatus=2


set hidden


let g:netrw_liststyle= 2 " Change the default style of netrw

" colo slate
syntax enable
set background=dark
colorscheme solarized


" folding stuff. Very nice for python
set foldmethod=indent
set foldlevel=20



"allows to jump to nearest fold that is closed
nnoremap <silent> <leader>zj :call NextClosedFold('j')<cr>
nnoremap <silent> <leader>zk :call NextClosedFold('k')<cr>
function! NextClosedFold(dir)
    let cmd = 'norm!z' . a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction

"this saves the folding automatically. only works with foldmethod=manual
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview


noremap <F2>  <Esc>:w<Enter>:!root -l %<Enter>
noremap <F3> <Esc>:w<Enter>:!python %<Enter>
noremap <F4> <Esc>:w<Enter>:!./%<Enter>
noremap <F6> <Esc>:w<Enter>:!pdflatex %<Enter>


inoremap <c-y>  {<CR><tab><CR>}<up><right>
  
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

:command Pandoc !pandoc -f markdown -t latex -o %:r.pdf %
:command Pdf !xdg-open %:r.pdf &
syntax on
set shiftwidth=4

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

nnoremap <leader>d o<Esc>0istd::cout<<" #### *!*Debug*!* 1 #### "<<std::endl;<Esc>0
nnoremap <leader>r /\*\!\*Debug\*\!\*<Enter>dd
nnoremap <leader>mc ?\/\*<Enter>d/\*\/<Enter>dd
" the following allow to change -> and . in c++ code
nnoremap öp /\D\.\D<CR>ls-><Esc>:nohlsearch<CR>
nnoremap öo /\D->\D<CR>lc2l.<Esc>:nohlsearch<CR>

nnoremap H :bp<CR>
nnoremap L :bn<CR>

nnoremap <space> i<space><Esc>l
nnoremap <leader>dm %x``x
nnoremap <leader>sc :setlocal spell spelllang=en_us
nnoremap <leader>g <C-]>

vnoremap <leader>y "+y
nnoremap <leader>p "+p


nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader><space> <Esc>/<++><Enter>c4l

"tab movement
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt

" <Esc> mappings
inoremap kj <Esc>
cmap kj <Esc>

" German keyboard mappings
nnoremap ä /
nnoremap öh :nohlsearch<CR> 

"experimental
nnoremap ön :set nu!<CR>
nnoremap öq :qa<CR>
nnoremap öt :tabedit 
" German keyboard mappings


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

" If pasting in visual mode the default register is not overwritter
xnoremap <silent> p p:if v:register == '"'<Bar>let @@=@0<Bar>endif<cr>

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

set tags+=/home/janik/terascale_school/app/solution/tags

" custom colour stuff
hi Search ctermbg=DarkBlue ctermfg=DarkRed
hi Folded ctermbg=DarkMagenta ctermfg=DarkRed



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
