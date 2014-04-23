set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim' 
Bundle 'scrooloose/nerdcommenter' 
Bundle 'kevinw/pyflakes-vim' 
Bundle 'chriskempson/base16-vim' 
Bundle 'git://github.com/tpope/vim-fugitive.git'
Bundle 'git://github.com/tpope/vim-abolish.git'
Bundle 'git://github.com/Lokaltog/vim-powerline.git'
Bundle 'git://github.com/Lokaltog/vim-easymotion.git'
Bundle 'git://github.com/airblade/vim-gitgutter.git'
Bundle 'git://github.com/Shougo/neocomplcache.vim.git'

filetype plugin indent on
syntax enable "Enable syntax highlighting
set nomore ttyfast expandtab ignorecase showmode showcmd nohidden wildmenu cursorline ruler undofile number smartcase gdefault incsearch showmatch hlsearch lazyredraw splitright splitbelow ttimeout notimeout nottimeout autoindent shiftround autoread nobackup wrap list
set shell=/bin/bash "Default shell
set modelines=0
set encoding=utf-8
set shellcmdflag=-ic "Vim shell will also use ~/.bashrc configuration
set tabstop=4
set shiftwidth=4
set softtabstop=4
set scrolloff=3 "Screen will scroll at the 3rd of last/first line in the screen
set wildmode=list:longest "Show full item on the dropdown
set laststatus=2
set linespace=2
set history=1000
set undoreload=10000
set matchtime=3 "How long the matched bracket will be shown after it's match is created
set showbreak=↪ "Symbol when the line is breaked on wrapping
set fillchars=diff:\  "Show latest changed stuff in the status line when available
set dictionary=/usr/share/dict/words "Dictionary, also used for completion
set formatoptions=qrn1 "Format for pasting text
set textwidth=72 "Wrap (or autobreak if possible, usually on comments) at column 80
set colorcolumn=72
set listchars=tab:▸\ ,extends:❯,precedes:❮ "Substite hidden characters
set clipboard=unnamed "Include desktop clipboard for pasting from outside vim
set guioptions-=mT  "remove menu bar
set guioptions+=LlRrb "remove right-hand scroll bar
set guioptions-=LlRrb
set wildignore+=.hg,.git,.svn,*.aux,*.out,*.toc,*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.luacd,*.o,*.obj,*.exe,*.dll,*.manifest,*.pyc,*.spl,*.sw?,*.DS_Store?,*.class
set backupskip=/tmp/*,/private/tmp/*" "Skip backup in these dirs
set dir=~/.vim/swaps//,/var/tmp//,/tmp//,. "Set swap dir
set undodir=~/.vim/undos//,/var/tmp//,/tmp//,."Set undo dir
set scrolljump=8 " Scroll 8 lines at a time at bottom/top
set background=dark
set guifont=Droid\ Sans\ Mono:h12
colorscheme base16-ocean

let mapleader ="," "Leader key

"<tab> on normal will move to the next matching bracket
nnoremap <tab> % 

"Remove arrow keys binding and replace to hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

"Paste will adjust indent based on the current line
nnoremap p ]p
nnoremap P ]P

"Insert blank line above/below cursors
nnoremap zj :set paste<CR>m`o<Esc>``:set nopaste<CR> 
nnoremap zk :set paste<CR>m`O<Esc>``:set nopaste<CR>

"Line/Block indenting in visual mode using <tab> and <s-tab>
vnoremap <silent><S-TAB> <gv
vnoremap <silent><TAB> >gv

"Remove whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"Search shortcut for smartcase 
nnoremap / /\v
vnoremap / /\v

"Clear highlighted match
nnoremap <silent><leader><space> :noh<cr>

"Search mappings: Highlight next/prev result
map N Nzz
map n nzz

"Exit from insert to normal
inoremap jk <ESC>

"Save file as sudoers with :w!!
cmap w!! %!sudo tee > /dev/null %

inoremap <silent><C-j> <ESC>:tabnext<cr>
inoremap <silent><C-k> <ESC>:tabprevious<cr>
nnoremap <silent><C-j> :tabnext<cr>
nnoremap <silent><C-k> :tabprevious<cr>
inoremap <silent><C-h> <ESC>:bprevious<cr>
nnoremap <silent><C-h> :bprevious<cr>
inoremap <silent><C-l> <ESC>:bnext<cr>
nnoremap <silent><C-l> :bnext<cr>

nnoremap <silent><leader>r :w !python<cr>
nnoremap <silent><leader>t :w !bash<cr>

"Fast edit and reload vimrc
nnoremap <leader>ev :tabnew ~/.vimrc<cr>
nnoremap <leader>er :source ~/.vimrc<cr>

" Disable man page shortcut
nnoremap <S-k> <ESC>

nnoremap <silent><leader>g :Gstatus<cr>

nnoremap <silent><C-b> :CtrlPBuffer<cr>
inoremap <silent><C-b> <ESC>:CtrlPBuffer<cr>

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
