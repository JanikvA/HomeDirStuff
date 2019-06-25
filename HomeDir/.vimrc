" vimrc Janik
let mapleader = ","
set nocompatible
set statusline=
" ### Remove if you don't use Vundle ###
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Plugin 'Valloric/YouCompleteMe'
" Plugin 'maralla/completor.vim' "needs vim 8, checkout CoC
Plugin 'neoclide/coc.nvim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-commentary'
" Plugin 'easymotion/vim-easymotion'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/gv.vim' " :GV will open commit browser
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'lervag/vimtex'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'mbbill/undotree'
Plugin 'tpope/vim-repeat'
Plugin 'junegunn/vim-easy-align'
Plugin 'wellle/targets.vim'
Plugin 'chiel92/vim-autoformat'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/rainbow_parentheses.vim'

Plugin 'w0rp/ale'

" Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'svermeulen/vim-easyclip'

Plugin 'google/vim-searchindex'
Plugin 'francoiscabrol/ranger.vim'
Plugin 'ZoomWin'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/vim-peekaboo'


Plugin 'wellle/tmux-complete.vim'
Plugin 'thaerkh/vim-workspace'

" Plugin 'mhinz/vim-signify' "could replace gitgutter

" Plugin 'scrooloose/syntastic' "could replace ale
" Plugin 'sheerun/vim-polyglot' "makes stuff kinda slow
" Plugin 'junegunn/vim-slash'
" Plugin 'junegunn/limelight.vim'
" Plugin 'SearchComplete'
" Plugin 'vim-scripts/sherlock.vim'
" Plugin 'skwp/greplace.vim' "not really needed with :Ag from fzf and :cdo/cfdo
" Plugin 'tadaa/vimade' " makes not focused buffer fade. Nice idea but did not. highlight cursoline is enough
call vundle#end()
filetype plugin indent on

" thaerkh/vim-workspace
let g:workspace_autosave = 0
let g:workspace_autosave_untrailspaces = 0
let g:workspace_session_disable_on_args = 1
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_autosave_ignore = ['gitcommit','nerdtree','tagbar']


"svermeulen/vim-easyclip

let g:EasyClipShareYanks = 1
let g:EasyClipEnableBlackHoleRedirect = 0
let g:EasyClipYankHistorySize = 50
let g:EasyClipShareYanks = 1
let g:EasyClipShareYanksFile = 'easyclip'
let g:EasyClipShareYanksDirectory = $HOME . '/.vim/vim-persisted-undo/'
" let g:EasyClipShareYanksFile = '.vim/vim-persisted-undo/'

let g:EasyClipUseCutDefaults = 0
" only makes sense if EasyClipEnableBlackHoleRedirect is set to 1
" nmap x <Plug>MoveMotionPlug
" xmap x <Plug>MoveMotionXPlug
" nmap xx <Plug>MoveMotionLinePlug


"wellle/tmux-complete.vim
"with <c-x><c-u> you can doe completion of any text visilbe in any tmux pane
let g:tmuxcomplete#trigger = 'completefunc'

"junegunn/rainbow_parentheses.vim
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

" ranger.vim
let g:ranger_map_keys = 0
" let g:NERDTreeHijackNetrw = 0
" let g:ranger_replace_netrw = 1

" coc

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)



"completor
" XXX only uncomment this for completor

" let g:completor_clang_binary ='/usr/bin/clang-6.0'
" let g:completor_python_binary = '/usr/bin/python'
" let g:completor_complete_options = 'menuone,noselect,preview'
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" XXX

" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" let g:completor_auto_trigger = 1
" inoremap <expr> <Tab> pumvisible() ? "<C-N>" : "<C-R>=completor#do('complete')<CR>"

" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"


" " Use TAB to complete when typing words, else inserts TABs as usual.  Uses
" " dictionary, source files, and completor to find matching words to complete.
" " Note: usual completion is on <C-n> but more trouble to press all the time.
" " Never type the same word twice and maybe learn a new spellings!
" " Use the Linux dictionary when spelling is in doubt.
" function! Tab_Or_Complete() abort
"   " If completor is already open the `tab` cycles through suggested completions.
"   if pumvisible()
"     return "\<C-N>"
"   " If completor is not open and we are in the middle of typing a word then
"   " `tab` opens completor menu.
"   elseif col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"     return "\<C-R>=completor#do('complete')\<CR>"
"   else
"     " If we aren't typing a word and we press `tab` simply do the normal `tab`
"     " action.
"     return "\<Tab>"
"   endif
" endfunction

" Use `tab` key to select completions.  Default is arrow keys.

" " Use tab to trigger auto completion.  Default suggests completions as you type.
" let g:completor_auto_trigger = 0
" inoremap <expr> <Tab> Tab_Or_Complete()





"RainbowParantheses
autocmd VimEnter * RainbowParentheses

"vim-slash
" noremap <plug>(slash-after) zz
"vim-commentary
au FileType c,cpp setlocal commentstring=//\ %s

"vim-peekaboo
let g:peekaboo_delay = 1000

" yank stack
" let g:yankstack_map_keys = 0
" nmap Ö <Plug>yankstack_substitute_older_paste
" nmap Ä <Plug>yankstack_substitute_newer_paste

"  vim-autoformat
nnoremap <leader>af :Autoformat<cr>
nnoremap <leader>aaf :bufdo Autoformat<cr>


" vim-sneak
" map ö <Plug>Sneak_s
" map Ö <Plug>Sneak_S

" ale
let g:ale_echo_cursor = 1 " 0 makes cursor invisible if on line with error otherwise. Newer vim versions fix this
let g:ale_python_pylint_options = '-E'
nnoremap <leader>ale :ALEToggle<cr>

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" undotree
nnoremap <leader>u :UndotreeToggle<cr>
let g:undotree_ShortIndicators = 1

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
" let g:indent_guides_guide_size=1
" let g:indent_guides_start_level=2
" let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=26
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=6
"6,26

" goyo
nnoremap üg :Goyo<CR>

" vimtex
let maplocalleader = ","
" Disable all warnings
let g:vimtex_quickfix_latexlog = {'default' : 0}
let g:matchup_matchparen_deferred = 1
" work with youcompleteme
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

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

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all --bind ctrl-j:down --bind ctrl-k:up'

function! s:yank_list()
  redir => ys
  silent Yanks
  redir END
  return split(ys, '\n')[1:]
endfunction

function! s:yank_handler(reg)
  if empty(a:reg)
    echo "aborted register paste"
  else
    let token = split(a:reg, ' ')
    execute 'Paste' . token[0]
  endif
endfunction

command! FZFYank call fzf#run({
\ 'source': <sid>yank_list(),
\ 'sink': function('<sid>yank_handler'),
\ 'options': '-m',
\ 'down': 12
\ })

" This is now done just with <Enter>

" function! s:build_quickfix_list(lines)
"   call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
"   copen
"   cc
" endfunction
" let g:fzf_action = {
"   \ 'ctrl-q': function('s:build_quickfix_list'),
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-x': 'split',
"   \ 'ctrl-v': 'vsplit' }

"vim-gitgutter
let g:gitgutter_map_keys = 0 " to disable all gitgutter mappings
let g:gitgutter_enabled = 1 " disabled by default
nnoremap <leader>hn :GitGutterNextHunk<cr>
nnoremap <leader>hp :GitGutterPrevHunk<cr>
" nnoremap <Leader>ha :GitGutterStageHunk<cr>
" nnoremap <Leader>hr :GitGutterUndoHunk<cr>
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

"YouCompleteMe
" uncomment the following to activate syntax checking in c++ files
" let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
" set completeopt-=preview
" The following is usefull to find doc string for built in python funcitons.
" Kinda wanna make this work for c++
" nnoremap <leader>doc :YcmCompleter GetDoc<CR>


""syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"nnoremap <leader>sc :SyntasticCheck<CR>
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0
"let g:syntastic_python_checkers = ['pylint']  "" or ['flake8', 'pylint'], etc
"let g:syntastic_python_pylint_args = '-E'
"let g:syntastic_quiet_messages = {
"        \ "!level":  "errors",
"        \ "type":    "style",
"        \ "regex":   '.*',
"        \ "file:p":  '.*' }

" " easymotion
" let g:EasyMotion_do_mapping = 1 " Disable default mappings
" map ü <Plug>(easymotion-prefix)
" let g:EasyMotion_smartcase = 1


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

" ###################### Non-Plugin stuff ###########################
" gvim lol
set guioptions-=M  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=t  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guioptions-=m  "remove left-hand scroll bar
set guioptions-=g  "remove left-hand scroll bar
set guioptions-=e  "remove left-hand scroll bar
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
"set statusline+=%#LineNr#
"set statusline+=\ %f
"set statusline+=%m\
"set statusline+=%=
"set statusline+=%#CursorColumn#
"set statusline+=\ %y
""set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
""set statusline+=\[%{&fileformat}\]
"set statusline+=\ %p%%
"set statusline+=\ %l:%c
"set statusline+=\ 

" let g:netrw_liststyle= 2 " Change the default style of netrw

" colo slate
syntax enable
set background=dark
colorscheme solarized

" folding stuff. Very nice for python
set foldmethod=indent
set foldlevel=999

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
noremap <F6> <Esc>:w<Enter>:!pdflatex %<Enter>


inoremap <c-l>  {<CR><tab><CR>}<up><right>

" maybe use this instead of H,L
set wcm=<C-z>
nnoremap <leader><Tab> :buffer<Space><C-z><C-z>

set wildmenu "allows easier use of tab completions, e.g. :e <tab>
set wildmode=list:longest,full
" set path+=$PWD/** "adds the current dir and all subdirs to path. Nice for :find.
set confirm
set smartindent
set pastetoggle=<F5>
set ignorecase
set smartcase
set tabstop=4
set expandtab
set nu
set laststatus=2
set mouse=a
if has("mouse_sgr")
  set ttymouse=sgr
else
  set ttymouse=xterm2
end
set scrolloff=5
set hidden
set shiftwidth=4
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" set formatoptions-=cro " see :help fo-table
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o "don't auto insert comment. Seems to slow vim down a bit? check this

set backspace=indent,eol,start

:command W w
:command Q q
:command Wa wa

:command Pandoc !pandoc -f markdown -t latex -o %:r.pdf %
:command Pdf silent !xdg-open %:r.pdf &
syntax on

"TODO insert mappings:  c-y
inoremap <C-e> <Esc>:FZFYank<CR>
nnoremap <C-e> :FZFYank<CR>


"TODO for some reason this has a slight delay now. it is instant if i do <leader>dk
autocmd FileType c,cpp      nnoremap <buffer> <leader>d o<Esc>0istd::cout<<" #### *!*Debug*!* 1 #### "<<std::endl;<Esc>0
autocmd FileType python     nnoremap <buffer> <leader>d o<Esc>0iprint " #### *!*Debug*!* 1 #### "<Esc>0
nnoremap <leader>r /\*\!\*Debug\*\!\*<Enter>

" nnoremap <leader>mc ?\/\*<Enter>d/\*\/<Enter>dd
" the following allow to change -> and . in c++ code
nnoremap üp /\D\.\D<CR>ls-><Esc>:nohlsearch<CR>
nnoremap üo /\D->\D<CR>lc2l.<Esc>:nohlsearch<CR>

nnoremap H :bp<CR>
nnoremap L :bn<CR>

" This workaround leads to :SearchIndex being called twice. Maybe i can optimize it somehow
nmap n nzzg/
nmap N Nzzg/
"also centers the first search result
cnoremap <expr> <CR> getcmdtype() =~ '[/?]' ? '<CR>zz:SearchIndex<CR>' : '<CR>' 

" nnoremap <CR> :

nnoremap <space> i<space><Esc>l
nnoremap <leader>o o<ESC> " could remove this
nnoremap <leader>O O<ESC> " could remove this
nnoremap <leader>dm %x``x
" nnoremap <leader>sc :setlocal spell spelllang=en_us
nnoremap <leader>g <C-]>

" vnoremap <leader>y "+y
nnoremap <leader>y :let @+=@"<Cr>
nnoremap <leader>p "+p
" The following doesn't overwrite the register if you paste in visual mode
vnoremap p "_dP

" loacation list mappings
nnoremap <leader>ln :lne<cr>
nnoremap <leader>lp :lp<cr>


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

" " Needed to be able to properly map the alt key
" execute "set <A-h>=\eh"
" execute "set <A-j>=\ej"
" execute "set <A-k>=\ek"
" execute "set <A-l>=\el"

" " provide hjkl movements in Insert mode and Command-line mode via the <Alt> modifier key
" noremap! <A-h> <Left>
" noremap! <A-j> <Down>
" noremap! <A-k> <Up>
" noremap! <A-l> <Right>

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


" custom colour stuff
" hi Search ctermbg=DarkBlue ctermfg=DarkRed
" hi Folded ctermbg=DarkMagenta ctermfg=DarkRed

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
au FileType tex :NoMatchParen
au FileType tex setlocal nocursorline


" ###############################
" ########## Snippets ###########
" ###############################



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
