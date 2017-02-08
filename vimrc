set nocompatible              " be iMproved, required
filetype off                  " required
colorscheme sourcerer
" tab to spaces
set tabstop=4 shiftwidth=4 expandtab
set autoindent
" enable mouse
set mouse=a
" hightlight current line
set cursorline
set relativenumber
set number
" incremental search
set incsearch
" hightlight search
set hlsearch
" show commands
set showcmd
" split options
set splitbelow
set splitright
" remove esc delay to return to visual mode quickly
set timeoutlen=1000 ttimeoutlen=0
" set font for mvim
" set guifont=Meslo\ LG\ M\ for\ Powerline:h12
" disable autoload on session start
let g:session_autoload = no

" Maximize
" Change to position of second monitor
"function Windowspos()
"    winpos 1440 0
"endfunction

"autocmd GUIEnter * call Windowspos()
"autocmd GUIEnter * call libcallnr('maximize', 'Maximize', 1)

" save temp files in a different path
set dir=~/.vimswap//,/var/tmp//,/tmp//

" to start airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0 " show open/closed buffers
let g:airline#extensions#tabline#tab_nr_type = 0 " tab number
let g:airline#extensions#tabline#fnamemod = ':t' " tab number
" powerline theme
let g:airline_theme='base16'

"shortcuts
map <Leader>1 :NERDTreeToggle<CR>
nmap <Leader>2 :TagbarToggle<CR>

" run script to make blockmayus = esc
" map <Leader>e :!xmodmap ~/.speedswapper<CR>

" exhuberant-ctags
" map <Leader>t :!ctags --languages=PHP -R .<CR>
" patched exhuberant-ctags with PHP namespaces
set tags=./.ctags
map <Leader>t :!ctags -R --fields=+aS --languages=php .<CR>
map <Leader>c :SyntasticCheck phpcs<CR>
map <Leader>m :SyntasticCheck phpmd<CR>

" hide php variables on Tagbar
let g:tagbar_type_php  = {
  \ 'ctagstype' : 'php',
  \ 'kinds'     : [
          \ 'i:interfaces',
          \ 'c:classes',
          \ 'd:constant definitions',
          \ 'f:functions',
          \ 'j:javascript functions:1'
  \ ]
\ }

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " workaround for ctrlp not using .gitignore absolute path
  let g:ctrlp_working_path_mode = 'ra'
endif

" multicursor shortcuts
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" tabgar autofocus and close on select
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_show_linenumbers = 2

" close Nerdtree on open
let NERDTreeQuitOnOpen = 1

" show line numbers on NerdTree
let NERDTreeShowLineNumbers=1

" move lines with Control key
let g:move_key_modifier = 'C'

" stop at breakpoints on debugging
" let g:dbgPavimBreakAtEntry = 1

" Ctrlp options
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_match_window = 'max:20,results:20'
let g:ctrlp_custom_ignore = '.ico\|.db\|.svg\|.gif\|.jpg\|.jpeg\|.png\|vendor\|node_modules\|\~$'

" Syntastic options
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_php_checkers = ['php'] " removed phpcs and phpmd to execute manually
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_aggregate_errors = 1

" PHPDOC config
map <Leader>d :call PhpDoc()<CR>

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" Execute 'UltiSnipsAddFiletypes php' if necessary
let g:UltiSnipsSnippetsDir="~/.vim/bundle/vim-snippets/UltiSnips"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

" Do not open split window with doc when using Omnicompletion
set completeopt-=preview

" use namespace plugin with <leader>e
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>

autocmd QuickFixCmdPost *log* cwindow

" Config Calendar
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" Delete trailing spaces, e flag to be silent.
command DelTrailing :%s/\s\+$//e

" Text object mapping
" map cie ci"
" map cae ca"
" map die di"
" map dae da"
" map vie vi"
" map vae va"

" Something with html?
" onoremap :<C-U>normal! /\v<\?(.*?[\r\n]*)\?>/<CR>

" CSS
" One line to multiline
command -range CssToMultiline <line1>,<line2>s/\([{;]\|}\&\)\s*/\1\r /g
" Multiline to one line
command -range=% CssToLine <line1>,<line2>g/[;}]\s*$/-1j]

" Easymotion
" Disable default mappings
let g:EasyMotion_do_mapping = 0
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" Line motions
map <Leader>g <Plug>(easymotion-lineforward)
map <Leader>f <Plug>(easymotion-j)
map <Leader>d <Plug>(easymotion-k)
map <Leader>s <Plug>(easymotion-linebackward)

" Move to line
nmap <Leader>e <Plug>(easymotion-overwin-line)
" Move to word
nmap <Leader>w <Plug>(easymotion-overwin-w)

map  <space>/ <Plug>(easymotion-sn)
omap <space>/ <Plug>(easymotion-tn)
" Easymotion - end

" IncSearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
" IncSearch - end

" unhighlight
map <c-H> :nohlsearch<CR>

" Split navigation
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" JSX lint
let g:jsx_ext_required = 0

" BUNDLE
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Search files
Plugin 'https://github.com/ctrlpvim/ctrlp.vim'

" File tree (nerdtree)
Plugin 'https://github.com/scrooloose/nerdtree.git'
" nerdtree on all tabs
Bundle 'jistr/vim-nerdtree-tabs'

" git integration. Show git info on nerdtree
Plugin 'https://github.com/Xuyuanp/nerdtree-git-plugin.git'

" git integration. Shows line state on margin.
Plugin 'airblade/vim-gitgutter'

" git integration. Git commands.
Plugin 'https://github.com/tpope/vim-fugitive.git'

" emmet plugin for html
Plugin 'mattn/emmet-vim'

" multiple cursors
Plugin 'https://github.com/terryma/vim-multiple-cursors.git'

" show functions and vars on current file
Plugin 'https://github.com/majutsushi/tagbar.git'

" plugins for snippets
Plugin 'https://github.com/SirVer/ultisnips.git'
Plugin 'honza/vim-snippets'

" react snippets
Bundle 'justinj/vim-react-snippets'

" comment lines with gcc command
Plugin 'https://github.com/tomtom/tcomment_vim.git'

" match tags with %
Plugin 'https://github.com/tmhedberg/matchit.git'

" surround text objects
Plugin 'https://github.com/tpope/vim-surround.git'

" move line with ctrl[j,k]
Plugin 'https://github.com/matze/vim-move.git'

" repeat commands with '.' for surround plugin (among others)
Plugin 'https://github.com/tpope/vim-repeat.git'

" silver searcher
Plugin 'https://github.com/rking/ag.vim.git'

" debuger
" plugin 'https://github.com/joonty/vdebug.git'

" hightlight html tags
Plugin 'https://github.com/gregsexton/MatchTag.git'

" code linter
Plugin 'https://github.com/scrooloose/syntastic.git'

" auto-close
Plugin 'https://github.com/jiangmiao/auto-pairs.git'

" generate phpdoc
Bundle 'vexxor/phpdoc.vim'

" autocomplete namespaces
Bundle 'arnaud-lb/vim-php-namespace'

" refactor tool
Plugin 'adoy/vim-php-refactoring-toolbox'

" airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" tmux airline
Bundle 'edkolev/tmuxline.vim'

" blade syntax
Plugin 'jwalton512/vim-blade'

" php complete
Plugin 'shawncplus/phpcomplete.vim'

" calendar
Plugin 'itchyny/calendar.vim'

" easy motion
Plugin 'easymotion/vim-easymotion'
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'

" less file syntax hightlight
Plugin 'groenewege/vim-less'

" Custom text objects
Plugin 'kana/vim-textobj-user'
Plugin 'fvictorio/vim-textobj-backticks'

" Vim jsx
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'mtscout6/syntastic-local-eslint.vim'

" Historic
"Plugin 'hjdivad/vimlocalhistory'

" session
"Plugin 'xolox/vim-session'

" Wakatime
"Plugin 'wakatime/vim-wakatime'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax enable
:
