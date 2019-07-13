" vimrc Janik
let mapleader = ","
set nocompatible
set statusline=
" ### Remove if you don't use Plug ###
call plug#begin('~/.vim/plugged')

" Plug 'maralla/completor.vim' "needs vim 8

Plug 'sirver/ultisnips'
Plug 'JanikvA/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mbbill/undotree'
Plug 'tpope/vim-repeat'
Plug 'wellle/targets.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'mhinz/vim-startify'
Plug 'JanikvA/vim-yankstack'

Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

Plug 'chiel92/vim-autoformat'
Plug 'junegunn/vim-easy-align'
Plug 'lervag/vimtex'
Plug 'junegunn/gv.vim' " :GV will open commit browser
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'sheerun/vim-polyglot'
Plug 'zirrostig/vim-schlepp'
Plug 'google/vim-searchindex'
Plug 'AndrewRadev/switch.vim'

" Plug 'svermeulen/vim-easyclip'
" Plug 'maxbrunsfeld/vim-yankstack'

" Pretty much all i want from these is the highlighting of the current search match. Should really try to replace these
" Plug 'qxxxb/vim-searchhi'
" Plug 'osyo-manga/vim-anzu'

" Plug 'Valloric/YouCompleteMe' " for vim <8
" Plug 'neoclide/coc.nvim', {'branch': 'release'} "needs vim 8
" Plug 'wellle/tmux-complete.vim'

" Plug 'junegunn/vim-after-object'

" Plug 'junegunn/vim-online-thesaurus'

" Plug 'w0rp/ale'
" Plug 'thaerkh/vim-workspace'

" Plug 'tpope/vim-unimpaired'
" Plug 'francoiscabrol/ranger.vim'
" Plug 'tpope/vim-obsession'
" Plug 'mhinz/vim-signify' "could replace gitgutter
" Plug 'scrooloose/syntastic' "could replace ale
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
call plug#end()
filetype plugin indent on

" zirrostig/vim-schlepp

vmap <unique> <up>    <Plug>SchleppUp
vmap <unique> <down>  <Plug>SchleppDown
vmap <unique> <left>  <Plug>SchleppLeft
vmap <unique> <right> <Plug>SchleppRight

" vim-startify

    let g:startify_custom_header = []
    let g:startify_session_dir = '~/.vim/session'
    let g:startify_session_autoload = 1
    let g:startify_session_persistence = 1
    let g:startify_change_to_dir = 1
    let g:startify_change_to_vcs_root = 1
    let g:startify_session_number = 99
    let g:startify_session_sort = 0

    let g:startify_bookmarks = [ '~/.vimrc', '~/.bashrc', '~/.config/i3/config', '~/.vim/plugged/vim-snippets/UltiSnips/' ]
    let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]

    let g:startify_session_before_save = [
        \ 'echo "Cleaning up before saving.."',
        \ 'silent! NERDTreeTabsClose'
        \ ]

"maxbrunsfeld/vim-yankstack

let g:yankstack_map_keys = 0
nmap Ö <Plug>yankstack_substitute_older_paste
nmap Ä <Plug>yankstack_substitute_newer_paste

"junegunn/rainbow_parentheses.vim
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

"completor
" XXX only uncomment this for completor

let g:completor_clang_binary ='/usr/bin/clang-6.0'
let g:completor_python_binary = '/usr/bin/python'
let g:completor_complete_options = 'menuone,noselect,preview'
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" XXX

"RainbowParantheses
augroup dummy
  autocmd!
  autocmd VimEnter * RainbowParentheses
augroup END

"vim-commentary
augroup dummy
    au FileType c,cpp setlocal commentstring=//\ %s
    au FileType text setlocal commentstring=#\ %s
augroup END

"vim-peekaboo
let g:peekaboo_delay = 1000

"  vim-autoformat
nnoremap <leader>af :Autoformat
nnoremap <leader>aaf :bufdo Autoformat


" " ale
" let g:ale_echo_cursor = 1 " 0 makes cursor invisible if on line with error otherwise. Newer vim versions fix this
" let g:ale_python_pylint_options = '-E'
" nnoremap <leader>ale :ALEToggle<cr>

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" undotree
nnoremap <leader>u :UndotreeToggle<cr>
let g:undotree_ShortIndicators = 1
let g:undotree_SetFocusWhenToggle = 1

" guard for distributions lacking the 'persistent_undo' feature.
if has('persistent_undo')
    " define a path to store persistent undo files.
    let target_path = expand('~/.vim/vim-persisted-undo/')    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call system('mkdir -p ' . target_path)
    endif    " point Vim to the defined undo directory.
    let &undodir = target_path    " finally, enable undo persistence.
    set undofile
endif

" vim-indent-guides
let g:indent_guides_auto_colors = 0
augroup dummy
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=26
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=6
augroup END

" goyo
nnoremap üg :Goyo<CR>

" vimtex
let maplocalleader = ","
" Disable all warnings
let g:vimtex_quickfix_latexlog = {'default' : 0}
let g:matchup_matchparen_deferred = 1

let g:polyglot_disabled = ['latex']
let g:vimtex_compiler_latexmk = {
    \ 'backend' : 'process',
    \ 'background' : 1,
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

" fzf
" If installed using git
set rtp+=~/.fzf

nnoremap <C-p> :FZF<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <leader>f :BLines<CR>
nnoremap <leader>m :Commands<CR>
nnoremap <leader>ag :Ag<CR>
nnoremap <leader>h :Helptags<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>k :Marks<CR>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-t> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)


let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all --bind ctrl-j:down --bind ctrl-k:up'

"vim-gitgutter
let g:gitgutter_map_keys = 0 " to disable all gitgutter mappings
let g:gitgutter_enabled = 1 " disabled by default
nnoremap <leader>hn :GitGutterNextHunk<cr>
nnoremap <leader>hp :GitGutterPrevHunk<cr>
nnoremap <Leader>gghl :GitGutterLineHighlightsToggle<CR>
nnoremap <Leader>ggf :GitGutterFold<CR>
nnoremap <Leader>ggt :GitGutterToggle<CR>
set updatetime=4000 "[ms] default is 4000 ms i.e 4s

" vim-airline
" let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#wordcount#enabled = 0 " Makes sometimes problems with Goyo

" Comment out next 2 lines to show current git branch. makes vim slow if
" working with mount
let g:airline_section_b = '%-0.10{getcwd()}'
let g:airline_section_c = '%t'

let g:airline_section_error=''
let g:airline_section_warning=''
let g:airline_solarized_bg='dark'

"fugitive
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
set diffopt+=vertical

"tagbar
nmap <leader>c :TagbarToggle<CR>
let g:tagbar_map_nexttag = "<C-J>"
let g:tagbar_map_prevtag = "<C-K>"
let g:tagbar_show_linenumbers = 1

set wildignore+=*/.pyc/*,*/.swp/*,*/.root/*,*/.so/*

"scrooloose/nerdtree
map <leader>e :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.swp$','\.root$','\.o$','\.pyc$', '\~$']

" nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" UltiSnips
let g:UltiSnipsExpandTrigger="<C-a>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

" ### remove if not present ###

let g:netrw_liststyle= 2 " Change the default style of netrw

" colo slate
syntax enable
set background=dark
colorscheme solarized

" folding stuff
"Very nice for python
set foldmethod=indent
set foldlevel=999
nnoremap <leader>z :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0<CR>

" set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
" set undodir=~/.vim/undo//

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

noremap <F2>  <Esc>:w<Enter>:!root -l %<Enter>
noremap <F3> <Esc>:w<Enter>:!python %<Enter>
" noremap <F3> <Esc>:w !python<CR>
vnoremap <F3> :w !python<CR>
noremap <F4> <Esc>:w<Enter>:!./%<Enter>
noremap <F5> <Esc>:w<Enter>:!./% 
noremap <F7> <Esc>:w<Enter>:!pdflatex %<Enter>


inoremap <c-l>  {<CR><tab><CR>}<up><right>

" maybe use this instead of H,L
set wcm=<C-z>
" nnoremap <leader><Tab> :buffer<Space><C-z><C-z>
nnoremap <leader><Tab> :buffer<Space><C-z>

set wildmenu "allows easier use of tab completions, e.g. :e <tab>, :buffer <tab>
set wildmode=list:longest,full
" set path+=$PWD/** "adds the current dir and all subdirs to path. Nice for :find.
set confirm
set smartindent
set pastetoggle=<F6>
set ignorecase
set smartcase
set tabstop=4
set expandtab
set nu
set rnu
set laststatus=2
set mouse=a
if has("mouse_sgr")
  set ttymouse=sgr
else
  set ttymouse=xterm2
end
set spelllang=en_us   "type '=z' after ':set spell' with cursor on misspelled word
set scrolloff=5
set sidescrolloff=7         " Start scrolling n chars before end of screen.
set sidescroll=2            " The minimal number of columns to scroll horizontally
set hidden
set shiftwidth=4
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" set formatoptions-=cro " see :help fo-table
augroup dummy
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o "don't auto insert comment. Seems to slow vim down a bit? check this
augroup END

set lazyredraw              " don't update the display while executing macros
set ttyfast                 " Send more characters at a given time.
set nobackup
set nowritebackup
set magic "enables extended regex"

set backspace=indent,eol,start

:command W w
:command Q q
:command Wa wa

:command Exe !chmod +x %
:command Pandoc !pandoc -f markdown -t latex -o %:r.pdf %
:command Pdf silent !xdg-open %:r.pdf &
syntax on

"TODO insert mappings:  c-y
inoremap <C-e> <C-x><C-p>

"TODO for some reason this has a slight delay now. it is instant if i do <leader>dk
augroup dummy
  autocmd FileType c,cpp      nnoremap <buffer> <leader>d o<Esc>0istd::cout<<" #### *!*Debug*!* 1 #### "<<std::endl;<Esc>0
  autocmd FileType python     nnoremap <buffer> <leader>d o<Esc>0iprint " #### *!*Debug*!* 1 #### "<Esc>0
augroup END
nnoremap <leader>r /\*\!\*Debug\*\!\*<Enter>

nnoremap H :bp<CR>
nnoremap L :bn<CR>

" This workaround leads to :SearchIndex being called twice. Maybe i can optimize it somehow
nmap <silent> n nzzg/
nmap <silent> N Nzzg/
"also centers the first search result. TODO gives annoying error msg if no match is found
cnoremap <expr> <CR> getcmdtype() =~ '[/?]' ? '<CR>zz:SearchIndex<CR>' : '<CR>' 


nnoremap <space> i<space><Esc>l
nnoremap <leader>o o<ESC>
nnoremap <leader>O O<ESC>
nnoremap <leader>dm %x``x
nnoremap <leader>g <C-]>zz
nnoremap cm :%s///g<left><left>

" vnoremap <leader>y "+y
nnoremap <leader>y :let @+=@"<Cr>
nnoremap <leader>p "+p
nnoremap <leader>n gny:let @+=@"<Cr>

" set clipboard=unnamedplus

" disables vim from clearing clipboard after leaving/suspending vi session
" if executable("xclip")
function! PreserveClipboard()
  call system("xsel -ib", getreg('+')) "<- if using xsel
  " call system('echo ' . shellescape(getreg('+')) . 
  "         \ ' | xclip -selection clipboard')
  " call system("xclip -selection clipboard -i", getreg('+'))
endfunction
" function! PreserveClipboadAndSuspend()
"   " call PreserveClipboard()
"   call system("xsel -ib", getreg('+')) "<- if using xsel
"   suspend
" endfunction
augroup dummy
  autocmd VimLeave * call PreserveClipboard()
augroup END
" nnoremap <silent> <c-z> :call PreserveClipboadAndSuspend()<cr>
" noremap <silent> <c-z> :call system("xsel -ib", getreg('+'))<cr>:suspend<cr>
noremap <silent> <c-z> <Esc>:call system("xsel -ib", getreg('+'))<cr>:suspend<cr>
" vnoremap <silent> <c-z> :<c-u>call PreserveClipboadAndSuspend()<cr>
" endif

" The following doesn't overwrite the register if you paste in visual mode
vnoremap p "_dP

" quickfix list mappings
nnoremap <leader>cn :cnext<cr>
nnoremap <leader>cp :cp<cr>


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
nnoremap ä ?
nnoremap ö /
nnoremap üh :nohlsearch<CR>

"experimental
nnoremap ün :set nu!<CR>
nnoremap üq :qa<CR>
nnoremap üt :tabedit
" German keyboard mappings


"easier window movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Automatic paste mode for terminal
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction


" Automatic paste mode for terminal using tmux short cuts
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif
  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"
  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction
let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()


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


" makes stuff super laggy atm
set cursorline
nnoremap üc :set cursorline!<cr>
" hi CursorLine   ctermbg=black ctermfg=None
" hi CursorLine   cterm=underline ctermbg=black ctermfg=None

"make cursorline only in active window visible
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" does a quick google search. Only works good if an instance of firefox is
" already running
function! GoogleSearch(searchTerm)
     let tmp = a:searchTerm
     exec "silent !firefox http://google.com/search?q=\"" . tmp . "\""
     exec "redraw!"
endfunction
nnoremap <leader>j :call GoogleSearch("")<Left><Left>

function! GoogleSearchVisual()
     let searchterm = getreg("g")
     silent! exec "silent! !firefox \"http://google.com/search?q=" . searchterm . "\" &"
     exec "redraw!"
endfunction
vnoremap <leader>j "gy<Esc>:call GoogleSearchVisual()<CR>

" to make tex files smoother, maybe also turn off syntax. syntax off
augroup dummy
    au FileType tex :NoMatchParen
    au FileType tex setlocal nocursorline
augroup END

nnoremap <leader>vg :noautocmd vimgrep //gj `git ls-files`<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
nnoremap <leader>lv :vimgrep /<C-r>//g %<CR> \| !:copen <Enter>

set complete=.,t
set completeopt=menuone,noselect,preview,longest
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Make Y behave like other capitals
nnoremap Y y$

" qq to record, Q to replay
nnoremap Q @q

" ----------------------------------------------------------------------------
" #gi / #gpi | go to next/previous indentation level
" ----------------------------------------------------------------------------
function! s:indent_len(str)
  return type(a:str) == 1 ? len(matchstr(a:str, '^\s*')) : 0
endfunction
function! s:go_indent(times, dir)
  for _ in range(a:times)
    let l = line('.')
    let x = line('$')
    let i = s:indent_len(getline(l))
    let e = empty(getline(l))

    while l >= 1 && l <= x
      let line = getline(l + a:dir)
      let l += a:dir
      if s:indent_len(line) != i || empty(line) != e
        break
      endif
    endwhile
    let l = min([max([1, l]), x])
    execute 'normal! '. l .'G^'
  endfor
endfunction
nnoremap <silent> gi :<c-u>call <SID>go_indent(v:count1, 1)<cr>
nnoremap <silent> gpi :<c-u>call <SID>go_indent(v:count1, -1)<cr>



function! s:todo() abort
  let entries = []
  for cmd in ['git grep -niI -e TODO -e FIXME -e XXX 2> /dev/null',
            \ 'grep -rniI -e TODO -e FIXME -e XXX * 2> /dev/null']
    let lines = split(system(cmd), '\n')
    if v:shell_error != 0 | continue | endif
    for line in lines
      let [fname, lno, text] = matchlist(line, '^\([^:]*\):\([^:]*\):\(.*\)')[1:3]
      call add(entries, { 'filename': fname, 'lnum': lno, 'text': text })
    endfor
    break
  endfor

  if !empty(entries)
    call setqflist(entries)
    copen
  endif
endfunction
command! Todo call s:todo()
