set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'vim-scripts/L9'
" Color scheme
Bundle 'chriskempson/base16-vim'
Bundle 'git://github.com/endel/vim-github-colorscheme'
" Git integration
Bundle 'git://github.com/tpope/vim-fugitive.git'
" String substitute for plural / singular (context sensitive)
Bundle 'git://github.com/tpope/vim-abolish.git'
" Language-agnostic commenting plugin
Bundle 'git://github.com/tpope/vim-commentary.git'
" Should I say more?
Bundle 'git://github.com/Lokaltog/vim-powerline.git'
" Awesome jumping to text
Bundle 'git://github.com/Lokaltog/vim-easymotion.git'
" Showing git diff
Bundle 'git://github.com/airblade/vim-gitgutter.git'
" Send command from vim to iTerm2
Bundle 'git://github.com/matschaffer/vim-islime2.git'
" Python tag list
Bundle 'git://github.com/majutsushi/tagbar'
" Awesome HAML to HTML by CTRL-E on HTML files
Bundle 'git://github.com/rstacruz/sparkup'
" Auto close scope (brackets, quotes, etc)
Bundle 'git://github.com/Raimondi/delimitMate'
" Awesome completion
Bundle 'git://github.com/Valloric/YouCompleteMe'
" Snippet engine and snipet lists
Bundle 'git://github.com/honza/vim-snippets'
Bundle 'git://github.com/SirVer/ultisnips'
" Unite, async and tags support
Bundle 'git://github.com/Shougo/unite.vim'
Bundle 'git://github.com/Shougo/vimproc.vim'
Bundle 'git://github.com/Shougo/neomru.vim'
Bundle 'git://github.com/tsukkee/unite-tag'
" Text swap plugin
Bundle 'git://github.com/tommcdo/vim-exchange'
" Undo tree
Bundle 'git://github.com/sjl/gundo.vim.git'
" Highlight matching HTML tags
Bundle 'git://github.com/Valloric/MatchTagAlways'

filetype plugin indent on
syntax enable
set nomore ttyfast expandtab ignorecase showmode showcmd nohidden wildmenu cursorline ruler undofile number smartcase gdefault incsearch showmatch hlsearch lazyredraw splitright splitbelow ttimeout notimeout nottimeout autoindent shiftround autoread nobackup wrap list hidden
set shell=/bin/bash tabstop=4 shiftwidth=4 softtabstop=4 laststatus=2 linespace=1 scrolloff=3 history=100 undoreload=10000 scrolljump=8 matchtime=3  modelines=0 encoding=utf-8 textwidth=72 clipboard=unnamed background=light mouse=a backspace=2 completeopt-=preview
set showbreak=↪
set wildmode=list:longest "Show full item on the dropdown
set fillchars=diff:\  "Show latest changed stuff in the status line when available
set dictionary=/usr/share/dict/words
set formatoptions=qrn1 "Format for pasting text
set listchars=tab:┊\ 
set wildignore+=.hg,.git,.svn,*.aux,*.out,*.toc,*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.luacd,*.o,*.obj,*.exe,*.dll,*.manifest,*.pyc,*.spl,*.sw?,*.DS_Store?,*.class
set backupskip=/tmp/*,/private/tmp/*" 
set dir=~/.vim/swaps//,/var/tmp//,/tmp//,. 
set undodir=~/.vim/undos//,/var/tmp//,/tmp//,.

" Keymappings and shit
let mapleader =","
inoremap jk <ESC>
nnoremap <C-c> <ESC>
nnoremap j gj
nnoremap k gk
" Very magic mode search
nnoremap / /\v
"Insert blank line above/below cursors
nnoremap zj :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap zk :set paste<CR>m`O<Esc>``:set nopaste<CR>
"Remove whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" Clear highlighted match
nnoremap <silent><leader><space> :noh<cr>
" Run buffer as scripts
nnoremap <silent><leader>p :w !python<cr>
nnoremap <silent><leader>t :w !bash<cr>
" Reformat buffer as JSON
map <leader>aj <Esc>:%!python -m json.tool<cr>
" Paste and move cursor to the end of the line
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
" Visual select the just-pasted text
noremap gV `[v`]
" Fast edit and reload vimrc
nnoremap <leader>ev :e ~/.vimrc<cr>
nnoremap <leader>er :source ~/.vimrc<cr>
" Save as sudoers
cmap w!! %!sudo tee > /dev/null %
nnoremap <S-k> <ESC> " Disable man page shortcut
nnoremap <silent><leader>g :Gstatus<cr>

" PLUGIN CONFIGURATIONS
" -------------------------
let g:tname = ''
nnoremap <leader>we :execute "ISlime2 ./manage.py test " . tname<cr>
nnoremap <leader>z :TagbarToggle<cr>
nnoremap <silent><leader>u  :GundoToggle<cr>
let g:UltiSnipsExpandTrigger="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:ycm_key_list_previous_completion = ['<Up>'] " Remove S-Tab from this list for UltiSips
nnoremap <leader>d :YcmCompleter GoToDeclaration<cr>

" Unite configuration
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
    imap <buffer> <C-h>   <Plug>(unite_delete_backward_path)
endfunction
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy', 'matcher_hide_hidden_files', 'sorter_rank'])
nnoremap [unite] <Nop>
nmap <space> [unite]
nnoremap [unite]a :Unite -start-insert file<cr>
nnoremap [unite]e :Unite -start-insert file_rec/async<cr>
nnoremap [unite]s :Unite -start-insert tag<cr>
nnoremap [unite]f :Unite grep:.<cr>
nnoremap [unite]q :Unite history/yank<cr>
nnoremap [unite]c :Unite -quick-match file_mru<cr>
nnoremap [unite]d :Unite -quick-match buffer<cr>
