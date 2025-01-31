" vimrc Janik
set nocompatible

augroup dummy
    autocmd!
augroup END

let mapleader = ","
set statusline=
" ### Remove if you don't use Plug ###
call plug#begin('~/.vim/plugged')

if has('nvim')
    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
    endif
    Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
    Plug 'nixprime/cpsm', { 'do': './install.sh --PY3=ON' }

    " Plug 'deoplete-plugins/deoplete-jedi' 

    Plug 'prabirshrestha/async.vim'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'lighttiger2505/deoplete-vim-lsp'

else

    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
    Plug 'nixprime/cpsm', { 'do': './install.sh --PY3=ON' }

    " Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " " Plug 'https://gitlab.com/yramagicman/auto-omnicomplete.git'
    " Plug 'prabirshrestha/asyncomplete.vim'
    " Plug 'prabirshrestha/async.vim'
    " " Plug 'prabirshrestha/vim-lsp'
    " " Plug 'prabirshrestha/asyncomplete-lsp.vim'
    " Plug 'prabirshrestha/asyncomplete-buffer.vim'
    " " Plug 'prabirshrestha/asyncomplete-ultisnips.vim'

endif

Plug 'sirver/ultisnips'
Plug 'JanikvA/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-repeat'
Plug 'wellle/targets.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-startify'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'kkoomen/vim-doge'
Plug 'chiel92/vim-autoformat'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'svermeulen/vim-easyclip'
Plug 'thiagoalessio/rainbow_levels.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'google/vim-searchindex'
Plug 'junegunn/vim-easy-align'
Plug 'michaeljsmith/vim-indent-object'
Plug 'zirrostig/vim-schlepp'
    Plug 'junegunn/gv.vim' " :GV will open commit browser

if has('nvim')

    Plug 'majutsushi/tagbar'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'lervag/vimtex'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'sheerun/vim-polyglot'
    Plug 'airblade/vim-gitgutter'
    Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
    " Plug 'w0rp/ale'
"     Plug 'cyansprite/Extract' "could remove this now. it remaps s?
endif

    " for bookmarks with netrw?
    " Plug 'skywind3000/quickmenu.vim'

" Colors
Plug 'iCyMind/NeoSolarized'
if has('nvim')
    " Icons. Always load this as last plugin!
    Plug 'ryanoasis/vim-devicons'
endif

call plug#end()
filetype plugin indent on

function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction
nnoremap <leader><leader> :call FzyCommand("ag . --silent -l -g ''", ":e")<cr>

" " 'w0rp/ale'
" " Ale
" " let g:ale_lint_on_enter = 1
" " let g:ale_lint_on_text_changed = 'never'
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" " let g:ale_python_pylint_options = '-E'
" nnoremap <leader>ale :ALEToggle<cr>
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" " let g:ale_linters = {'python': ['flake8', 'pylint'], 'cpp':['cppcheck', 'clang-check-8']}
" let g:ale_linters = {'python':['flake8'], 'cpp':['cppcheck', 'clang-check-8']}
" let g:ale_fixers = {'python': ['black', 'isort', 'mypy'], 'cpp':['clang-format']}
" " let g:ale_python_autopep8_options='--aggressive --aggressive --max-line-length 79'
" " let g:ale_python_flake8_options='--ignore E501'
" let g:ale_c_parse_compile_commands=1 "will read compile_commands.json
" let g:ale_c_build_dir='../build' " use the following command to produce a json file with compiler flags: cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ../source/
" " let g:ale_cpp_clangcheck_executable='clang-check-8'
" let g:airline#extensions#ale#enabled = 1
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
" " Write this in your vimrc file
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_insert_leave = 0
" let g:ale_lint_on_save = 1
" let g:ale_disable_lsp=1
" " let g:ale_open_list = 1

" 'https://gitlab.com/yramagicman/auto-omnicomplete.git'
" let g:AutoOmniComplete_complete_map="\<c-x>\<c-n>"

" 'prabirshrestha/asyncomplete.vim'

" if !has('nvim')
" let g:asyncomplete_auto_popup = 1
" function! s:check_back_space() abort
"     let col = col('.') - 1
"     return !col || getline('.')[col - 1]  =~ '\s'
" endfunction
" inoremap <silent><expr> <TAB>
"   \ pumvisible() ? "\<C-n>" :
"   \ <SID>check_back_space() ? "\<TAB>" :
"   \ asyncomplete#force_refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" " if has('python3')
" "     let g:UltiSnipsExpandTrigger="<c-a>"
" "     call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
" "         \ 'name': 'ultisnips',
" "         \ 'whitelist': ['*'],
" "         \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
" "         \ }))
" " endif
" call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
"     \ 'name': 'buffer',
"     \ 'whitelist': ['*'],
"     \ 'blacklist': [],
"     \ 'completor': function('asyncomplete#sources#buffer#completor'),
"     \ 'config': {
"     \    'max_buffer_size': 5000000,
"     \  },
"     \ }))
" endif

"svermeulen/vim-easyclip

let g:EasyClipShareYanks = 1
let g:EasyClipEnableBlackHoleRedirect = 0
let g:EasyClipYankHistorySize = 50
let g:EasyClipShareYanksFile = 'easyclip'
let g:EasyClipShareYanksDirectory = $HOME . '/.vim/vim-persisted-undo/'
let g:EasyClipUseCutDefaults = 0
"only makes sense if EasyClipEnableBlackHoleRedirect is set to 1
" nmap x <Plug>MoveMotionPlug
" xmap x <Plug>MoveMotionXPlug
" nmap xx <Plug>MoveMotionLinePlug

" easymotion
let g:EasyMotion_do_mapping=0
let g:EasyMotion_smartcase = 1

function! s:config_easyfuzzymotion(...) abort
    return extend(copy({
                \   'converters': [incsearch#config#fuzzyword#converter()],
                \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
                \   'keymap': {"\<CR>": '<Over>(easymotion)'},
                \   'is_expr': 0,
                \   'is_stay': 1
                \ }), get(a:, 1, {}))
endfunction
nmap <silent><expr> ö incsearch#go(<SID>config_easyfuzzymotion())

" 'thiagoalessio/rainbow_levels.vim'
nnoremap <leader>ig :RainbowLevelsToggle<CR>


" 'haya14busa/incsearch.vim'
let g:incsearch#auto_nohlsearch = 1
let g:incsearch#consistent_n_direction=1

" 'cyansprite/Extract'
let g:extract_maxCount=20
let g:extract_useDefaultMapping=0
imap <c-v> <Plug>(extract-completeList)

" 'kkoomen/vim-doge'
let g:doge_comment_interactive=1
let g:doge_mapping_comment_jump_forward="<C-k>"
let g:doge_mapping_comment_jump_backward="<C-b>"

" Shougo/deoplete.nvim

" if has('nvim')
    let g:deoplete#enable_at_startup = 1
	call deoplete#custom#option('smart_case', v:true)

    " matcher_cpsm
    call deoplete#custom#source('_', 'matchers', ['matcher_cpsm'])
    call deoplete#custom#source('_', 'sorters', [])
    " call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])

    " call deoplete#custom#var('around', {
    "             \   'range_above': 50,
    "             \   'range_below': 50,
    "             \   'mark_above': '[↑]',
    "             \   'mark_below': '[↓]',
    "             \   'mark_changes': '[*]',
    "             \})

    call deoplete#custom#var('tabnine', {
                \ 'line_limit': 100,
                \ })
                " \ 'max_num_results': 10,


if has('nvim')
    call deoplete#custom#var('tabnine', {
                \ 'line_limit': 500,
                \ })
                " \ 'max_num_results': 10,
call deoplete#custom#option('sources', {
\ '_': ['tabnine', 'lsp'],
\})

call deoplete#custom#source('tabnine', 'rank', 600)
call deoplete#custom#source('lsp', 'rank', 100)

    " call deoplete#custom#var('clangx', 'clang_binary', '/usr/bin/clang')

    "TODO until i config this correctly turn of warnings and stuff
    let g:lsp_diagnostics_enabled = 0
    let g:lsp_highlights_enabled = 0
    let g:lsp_textprop_enabled = 0
    let g:lsp_virtual_text_enabled = 0
    let g:lsp_highlight_references_enabled = 0
    " highlight lspReference ctermfg=red guifg=red ctermbg=black guibg=green


    if (executable('pyls'))
        " let s:pyls_path = fnamemodify(g:python_host_prog, ':h') . '/'. 'pyls'
        augroup LspPython
            autocmd!
            autocmd User lsp_setup call lsp#register_server({
                        \ 'name': 'pyls',
                        \ 'cmd': {server_info->['pyls']},
                        \ 'whitelist': ['python']
                        \ })
        augroup END
    endif
    "cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ../source/
    if executable('ccls')
        augroup LspCpp
            autocmd!
            au User lsp_setup call lsp#register_server({
                        \ 'name': 'ccls',
                        \ 'cmd': {server_info->['ccls']},
                        \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
                        \ 'initialization_options': {'cache': {'directory': '/tmp/ccls/cache' }},
                        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc', 'cxx'],
                        \ })
        augroup END
    endif


    nnoremap gp :LspHover<CR>
    nnoremap gd :LspDefinition<CR>
    nnoremap gl :LspDeclaration<CR>
    nnoremap gi :LspImplementation<CR>


endif

" zirrostig/vim-schlepp

vmap <unique> <up>    <Plug>SchleppUp
vmap <unique> <down>  <Plug>SchleppDown
vmap <unique> <left>  <Plug>SchleppLeft
vmap <unique> <right> <Plug>SchleppRight
vmap <unique> <space> <Plug>SchleppDup

" vim-startify

let g:startify_custom_header = []
let g:startify_session_dir = '~/.vim/session'
let g:startify_session_autoload = 1
let g:startify_session_persistence = 1
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
let g:startify_session_number = 99
let g:startify_session_sort = 0

let g:startify_bookmarks = ['~/.vim/plugged/vim-snippets/UltiSnips/', '~/.vim/session/', '~/projects/' ]
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
            " \ 'slient! cclose',
            " \ 'slient! lclose'

"junegunn/rainbow_parentheses.vim
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

"RainbowParantheses
augroup dummy
    autocmd VimEnter * RainbowParentheses
augroup END

"vim-commentary
augroup dummy
    au FileType c,cpp setlocal commentstring=//\ %s
    au FileType text setlocal commentstring=#\ %s
augroup END

"  vim-autoformat
nnoremap <leader>af :Autoformat
nnoremap <leader>aaf :bufdo Autoformat

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" simnalamburt/vim-mundo
nnoremap <leader>u :MundoToggle<CR>

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
nnoremap <leader>rg :Rg!<CR>
nnoremap <leader>h :Helptags<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>a :BTags<CR>
nnoremap <leader>k :Marks<CR>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-t> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)



let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all --bind ctrl-d:deselect-all --bind ctrl-j:down --bind ctrl-k:up'
let g:fzf_commands_expect = 'alt-enter,ctrl-x'


command! -bang -nargs=* Rg
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
            \   <bang>0 ? fzf#vim#with_preview('up:60%')
            \           : fzf#vim#with_preview('right:50%','?'),
            \   <bang>0)

let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

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
let g:airline_extensions = ['tabline']
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#wordcount#enabled = 0 " Makes sometimes problems with Goyo

" Comment out next 2 lines to show current git branch. makes vim slow if
" working with mount
let g:airline_section_b = '%-0.25{getcwd()}'
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
let g:tagbar_sort = 0
let g:tagbar_compact = 1

set wildignore+=*/.pyc/*,*/.swp/*,*/.root/*,*/.so/*,*/.pdf*/,*/.o*/

"scrooloose/nerdtree
if has('nvim')
    map <leader>e :NERDTreeToggle<CR>
else
    map <leader>e :Explore<CR>
endif
let NERDTreeIgnore=['\.swp$','\.root$','\.so$','\.o$','\.pyc$', '\~$']

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
let g:UltiSnipsJumpForwardTrigger="<C-k>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"

" ### remove if not present ###

let g:netrw_liststyle= 2 " Change the default style of netrw
let g:netrw_banner = 0

syntax enable
set background=dark
colorscheme NeoSolarized

" folding stuff
set foldmethod=indent
set foldlevel=999
nnoremap <silent> <leader>z :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr<CR>zM

" set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

vnoremap <F3> :w !python<CR>
noremap <F4> <Esc>:w<Enter>:!./%<Enter>
noremap <F5> <Esc>:w<Enter>:!./%
noremap <F7> <Esc>:w<Enter>:!pdflatex %<Enter>

inoremap <c-l>  {<CR><tab><CR>}<up><right>

" maybe use this instead of H,L
set wcm=<C-z>
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
if has('nvim')
    set rnu
endif
set laststatus=2
set mouse=a
if !has('nvim')
    if has("mouse_sgr")
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    end
endif
set spelllang=en_us   "type '=z' after ':set spell' with cursor on misspelled word
set scrolloff=5
set sidescrolloff=7         " Start scrolling n chars before end of screen.
set sidescroll=2            " The minimal number of columns to scroll horizontally
set hidden
set shiftwidth=4
set shiftround
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
set ruler
set noerrorbells
set title
set formatoptions+=j

:command W w
:command Q q
:command Wa wa

:command CDC cd %:p:h
:command Exe !chmod +x %
:command Pandoc !pandoc -f markdown -t latex -o %:r.pdf %
:command Pdf silent !xdg-open %:r.pdf &
syntax on

"TODO insert mappings:  c-y
inoremap <C-e> <C-x><C-p>

nnoremap <leader>r /\*\!\*Debug\*\!\*<CR>

nnoremap H :bp<CR>
nnoremap L :bn<CR>

"" This workaround leads to :SearchIndex being called twice. Maybe i can optimize it somehow
nmap n nzzg/
nmap N Nzzg/
cnoremap <expr> <CR> getcmdtype() =~ '[/?]' ? '<CR>zz:SearchIndex<CR>' : '<CR>'


nnoremap <space> i<space><Esc>l
nnoremap <leader>o o<ESC>
nnoremap <leader>O O<ESC>
nnoremap <leader>dm %x``x
nnoremap <leader>g <C-]>zz
nnoremap <leader>G <C-W>}zz
nnoremap cm :%s///g<left><left>
vnoremap cm :s///g<left><left>

" vnoremap <leader>y "+y
nnoremap <leader>y :let @+=@"<Cr>
nnoremap <leader>p "+p
nnoremap <leader>n gny:let @+=@"<Cr>

function! PreserveClipboard()
    call system("xsel -ib", getreg('+')) "<- if using xsel
endfunction
augroup dummy
    autocmd VimLeave * call PreserveClipboard()
augroup END
noremap <silent> <c-z> <Esc>:call system("xsel -ib", getreg('+'))<cr>:suspend<cr>

" The following doesn't overwrite the register if you paste in visual mode
vnoremap p "_dP

" quickfix list mappings
nnoremap <leader>cn :cnext<cr>
nnoremap <leader>cp :cp<cr>

nnoremap <leader>ln :lnext<cr>
nnoremap <leader>lp :lprevious<cr>

nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>s :w<CR>

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
" nmap <s-ä> ?
nmap ä /
nnoremap üh :nohlsearch<CR>
nnoremap üq :qa<CR>
nnoremap ün :set nu!<CR>

"experimental
nnoremap üt :tabedit
" German keyboard mappings

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

nnoremap üc :set cursorline!<cr>

if has('nvim')
    " can makes stuff a bit laggy atm
    set cursorline
    ""make cursorline only in active window visible
    augroup dummy
        au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
        au WinLeave * setlocal nocursorline
    augroup END
endif

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

nnoremap <leader>vg :noautocmd vimgrep //gj `git ls-files`<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
nnoremap <leader>lv :vimgrep /<C-r>//g %<CR> \| !:copen <Enter>

set complete=.,w,b,u
set completeopt=menuone,noselect,longest,noinsert
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

" Make Y behave like other capitals
nnoremap Y y$

" qq to record, Q to replay
nnoremap Q @q
vnoremap Q :normal @q<CR>

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


"TODO <c-e>,<c-space>,<c-l>,<BS>,<s-u>,-,_,<c-q> normal mode mapping
"maybe also: <C-t>, <s-m>

cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

nnoremap <PageUp> <c-u>
nnoremap <Home> <c-d>

nnoremap <C-e> <C-w>w
nnoremap <C-q> <C-w>W


let g:matchparen_timeout = 20
let g:matchparen_insert_timeout = 20

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

" make buffer a scratch buffer
:command MakeScratch setlocal buftype=nofile |setlocal bufhidden=hide |setlocal noswapfile

" Terminal Function
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        if has('nvim')
            botright new
        else
            below terminal
        endif
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            if has('nvim')
                call termopen($SHELL, {"detach": 0})
            endif
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

tnoremap <C-e> <c-\><c-n><c-w>w
tnoremap <C-q> <c-\><c-n><c-w>W
tnoremap <C-g> <C-\><C-n>
tnoremap <Esc> <C-\><C-n>
nnoremap <C-t> :call TermToggle(6)<CR>
tnoremap <Esc> <C-\><C-n>:call TermToggle(6)<CR>

if has('nvim')
    function! TerminalOptions()
        " /* folded code */
        silent au BufEnter <buffer> startinsert!
        silent au BufLeave <buffer> stopinsert!
    endfunction
    au TermOpen * call TerminalOptions()
else
    function! TerminalOptions()
        " /* folded code */
        silent au BufEnter <buffer> exec "normal i"
        silent au BufLeave <buffer> stopinsert!
    endfunction
    au TerminalOpen * call TerminalOptions()
endif

" make c-q and c-s work
silent !stty -ixon > /dev/null 2>/dev/null

"works only with the easyclip plugin
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
nnoremap <leader><space> :FZFYank<CR>

nnoremap <leader>v :call TabToggle()<cr>
function! TabToggle()
    if tabpagewinnr(tabpagenr(), '$') > 1
        " Zoom in when this tab has more than one window
        tab split
    elseif tabpagenr('$') > 1
        " Zoom out when this tab is not the last tab
        if tabpagenr() < tabpagenr('$')
            tabclose
            tabprevious
        else
            tabclose
        endif
    endif
endfunction

if !has('nvim')
    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~ '\s'
    endfunction

    inoremap <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ asyncomplete#force_refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
endif

" set termguicolors
