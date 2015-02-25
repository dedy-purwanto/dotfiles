set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Plugin 'gmarik/vundle'
Plugin 'vim-scripts/L9'
" My favorite color scheme, solarised no more.
Plugin 'chriskempson/vim-tomorrow-theme'
" String substitute for plural / singular (context sensitive)
Plugin 'tpope/vim-abolish.git'
" Language-agnostic commenting plugin
Plugin 'tpope/vim-commentary.git'
" Status line, buffer shown like 'tabs'
Plugin 'bling/vim-airline'
" Awesome jumping to text
Plugin 'Lokaltog/vim-easymotion.git'
" Showing git diff
Plugin 'airblade/vim-gitgutter.git'
" Awesome HAML to HTML by CTRL-E on HTML files
Plugin 'rstacruz/sparkup'
" Awesome completion
Plugin 'Valloric/YouCompleteMe'
" Snippet engine and snipet lists
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
" Undo tree
Plugin 'sjl/gundo.vim.git'
" Highlight matching HTML tags
Plugin 'Valloric/MatchTagAlways'
" File and tags quick open
Plugin 'kien/ctrlp.vim'
" More accuracy and speed on CtrlP, needs compiling
Plugin 'JazzCore/ctrlp-cmatcher'
" Yank history management
Plugin 'vim-scripts/YankRing.vim'
" Python checking, I prefer this to syntastic
Plugin 'kevinw/pyflakes-vim'
" Color schemes
Plugin 'whatyouhide/vim-gotham'
Plugin 'chriskempson/base16-vim'
" File management
Plugin 'vim-scripts/FuzzyFinder'

filetype plugin indent on
syntax enable
set nomore ttyfast expandtab ignorecase showmode showcmd nohidden wildmenu cursorline ruler undofile relativenumber smartcase gdefault incsearch showmatch nocursorline
set hlsearch lazyredraw splitright splitbelow ttimeout notimeout nottimeout autoindent shiftround autoread nobackup wrap list hidden
set shell=/bin/bash tabstop=4 shiftwidth=4 softtabstop=4 laststatus=2 linespace=1 scrolloff=3 history=100 undoreload=10000 scrolljump=8 matchtime=3
set modelines=0 encoding=utf-8 textwidth=72 clipboard=unnamedplus background=dark mouse=a backspace=2 completeopt-=preview t_Co=256 colorcolumn=81 showbreak=↪ wildmode=list:longest
set fillchars=diff:\  "Show latest changed stuff in the status line when available
set dictionary=/usr/share/dict/words
set formatoptions=qrn1 "Format for pasting text
set list listchars=tab:>-,precedes:<,extends:>
set wildignore+=.hg,.git,.svn,*.aux,*.out,*.toc,*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.luacd,*.o,*.obj,*.exe,*.dll,*.manifest,*.pyc,*.spl,*.sw?,*.DS_Store?,*.class
set backupskip=/tmp/*,/private/tmp/*"
set dir=~/.vim/swaps//,/var/tmp//,/tmp//,.
set undodir=~/.vim/undos//,/var/tmp//,/tmp//,.
colorscheme base16-solarized
hi LineNr ctermfg=darkblue ctermbg=0
hi CursorLineNr ctermfg=darkblue ctermbg=0
hi Search ctermbg=darkblue ctermfg=white
hi MatchParen ctermbg=black ctermfg=darkgreen
hi Visual ctermbg=cyan ctermfg=black
hi String ctermfg=blue
" hi SpellBad ctermbg=1
hi ColorColumn ctermbg=black ctermfg=darkgreen
hi SignColumn ctermbg=0
hi GitGutterAdd ctermbg=0
hi GitGutterChange ctermbg=0
hi GitGutterDelete ctermbg=0
hi GitGutterChangeDelete ctermbg=0
hi VertSplit ctermbg=0 ctermfg=0 term=reverse
hi EasyMotionShade ctermfg=blue
hi Normal ctermbg=0
let mapleader =" "
inoremap jk <ESC>
nnoremap <C-c> <ESC>
nnoremap j gj
nnoremap k gk
nnoremap / /\v
nnoremap <silent><leader>c :noh<cr>
nnoremap <leader>ev :e ~/.vimrc<cr>
nnoremap <leader>er :source ~/.vimrc<cr>
nnoremap <leader>f :FufRenewCache<cr>:FufFile<cr>
nnoremap <leader>g :FufBuffer<cr>
"Insert blank line above/below cursors
nnoremap <leader>j :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <leader>k :set paste<CR>m`O<Esc>``:set nopaste<CR>
"Remove whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" Run buffer as scripts
nnoremap <silent><leader>1 :w !python<cr>
nnoremap <silent><leader>2 :w !bash<cr>
" Paste and move cursor to the end of the line
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
" Visual select the just-pasted text
noremap gV `[v`]
" Disable man page shortcut
nnoremap <S-k> <ESC>
nnoremap <leader>q :bd<cr>
nnoremap <leader>Q :bd!<cr>
nnoremap <leader>w :w<cr>
" PLUGIN CONFIGURATIONS
nnoremap <leader>d :YcmCompleter GoToDeclaration<cr>
nnoremap <silent><leader>y :YRShow<cr>
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:ycm_key_list_previous_completion = ['<Up>'] " Remove S-Tab for UltiSips
let g:airline_powerline_fonts = 1
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_max_height = 25
let g:ctrlp_extensions = ['tag', 'buffertag']
let g:yankring_replace_n_pkey = '<c-+>'
let g:yankring_history_dir = '/var/tmp/'
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_modified_removed = '~'
let g:gitgutter_sign_removed_first_line = '-'

" Macros
let @t="c{% trans \"\" %}jk4hp" " Surround selected text with trans
