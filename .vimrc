set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'kevinw/pyflakes-vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'snipmate-snippets'
Bundle 'garbas/vim-snipmate'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-scripts/FuzzyFinder'
Bundle 'vim-scripts/L9'
Bundle 'git://github.com/Lokaltog/vim-powerline.git'

" Core toggles for vim in order to support other customized stuff
set nocompatible "No compatibility with vi
set nomore "Disable messages
set ttyfast "Improve rendering
set shell=/bin/bash "Default shell
set modelines=0
set encoding=utf-8
filetype plugin indent on

" Customized toggles
syntax enable "Enable syntax highlighting
set shellcmdflag=-ic "Vim shell will also use ~/.bashrc configuration
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab "convert tab to spaces
set ignorecase "Ignore case for search, substitute, etc
set scrolloff=3 "Screen will scroll at the 3rd of last/first line in the screen
set showmode "Show what mode it is in (INSERT, VISUAL, REPLACE), at the bottom of the screen
set showcmd "Show what command we are typing at the bottom of the screen
set nohidden "Remove all hidden buffers
set wildmenu "Fully featured floating drop down for omnicompletion and stuff
set wildmode=list:longest "Show full item on the dropdown
set cursorline "Highlight current line
set ruler "Set ruler for margin
set laststatus=2 "Always show status line (bottom of the screen)
set undofile "Load undo file for the edited files when available, so we can undo things even if the file is just opened
set rnu "Show relative line numbering based on the current line
set history=1000 "Maximum history
set undoreload=10000 "Maximum number of undo loaded
set smartcase "Smart case for search, replace, etc
set gdefault "By default replace all match in the line when substituting (:%s or \v/s)
set incsearch "More realtime search results
set showmatch "Show matching brackets when inserted
set matchtime=3 "How long the matched bracket will be shown after it's match is created
set hlsearch "Highlight all the search results
set lazyredraw "Screen will not updated while running macros and stuff to make it faster
set showbreak=↪ "Symbol when the line is breaked on wrapping
set splitright "Newly created vertical split by default will be on the right
set splitbelow "Newly created horizontal split by default will be on the bottom
set fillchars=diff:\  "Show latest changed stuff in the status line when available
set ttimeout "Trio with two belows, wait for the complete key stroke before executing the appropriate mapping
set notimeout
set nottimeout
"set autochdir "Auto cd to the currently opened file (only for the current buffer)
set autoindent "Auto indentation
set shiftround "Round indentation  when using > and < to match with shiftwidth
set autoread "Auto reload buffer to the latest version when modified outside vim
set dictionary=/usr/share/dict/words "Dictionary, also used for completion
set formatoptions=qrn1 "Format for pasting text
set nobackup "Don't create backup
set wrap "Wrap on
set textwidth=80 "Wrap (or autobreak if possible, usually on comments) at column 80
set list "Show hidden characters
set listchars=tab:▸\ ,extends:❯,precedes:❮ "Substite hidden characters
set clipboard+=unnamed "Include desktop clipboard for pasting from outside vim
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions+=LlRrb "remove right-hand scroll bar
set guioptions-=LlRrb
set wildignore+=.hg,.git,.svn " Version control
set wildignore+=*.aux,*.out,*.toc " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg " binary images
set wildignore+=*.luacd " Lua byte code
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.pyc " Python byte code
set wildignore+=*.spl " compiled spelling word lists
set wildignore+=*.sw? " Vim swap files
set wildignore+=*.DS_Store? " OSX bullshit
set wildignore+=*.class " java sstuff
set backupskip=/tmp/*,/private/tmp/*" "Skip backup in these dirs
set dir=~/.vim/swaps//,/var/tmp//,/tmp//,. "Set swap dir
set undodir=~/.vim/undos//,/var/tmp//,/tmp//,."Set undo dir

"Theme
set background=dark
colorscheme solarized

let mapleader ="," "Leader key

"Tab on normal will move to the next matching bracket
nnoremap <tab> %

"Remap semicolon to fullcolon so we don't have to press shift-;
nnoremap ; :
vnoremap ; :

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

"Paste and automatically adjust the indent following the current line indentation
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

"Search mappings: These will make it so that going to the next one in a search will center on the line it's found in.
map N Nzz
map n nzz

"Exit from insert to normal
inoremap jk <ESC>

"Save file as sudoers with :w!!
cmap w!! %!sudo tee > /dev/null %

"Move current tab to left/right with C-j and C-k, swith to next/prev tab with C-h and C-l
inoremap <silent><C-j> <ESC>:execute 'silent! tabmove ' . (tabpagenr()-2)<cr>
inoremap <silent><C-k> <ESC>:execute 'silent! tabmove ' . tabpagenr()<cr>
inoremap <silent><C-l> <ESC>:tabnext<cr>
inoremap <silent><C-h> <ESC>:tabprevious<cr>
nnoremap <silent><C-j> :execute 'silent! tabmove ' . (tabpagenr()-2)<cr>
nnoremap <silent><C-k> :execute 'silent! tabmove ' . tabpagenr()<cr>
nnoremap <silent><C-l> :tabnext<cr>
nnoremap <silent><C-h> :tabprevious<cr>

"Increase number with ctrl-a conflict with tmux mapping
nnoremap <C-A-a> <C-a>

"Fast edit and reload vimrc
nnoremap <leader>ev :tabnew ~/.vimrc<cr>
nnoremap <leader>er :source ~/.vimrc<cr>

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="


"-----------------------------------------------------------------
"Plugin Configurations
"-----------------------------------------------------------------

"vim-fuf shortcuts
"Auto renew and open
nnoremap <silent><leader>j :FufRenewCache<CR>:FufFile<CR>
nnoremap <silent><leader>b :FufBuffer<CR>
let g:fuf_file_exclude = 'v\~$|\.pyc$|\.orig$|\.bak$|\.swp$|\.swo$'

"Nerdtree configs
nnoremap <silent><F2> :NERDTreeToggle<cr>
inoremap <silent><F2> <ESC>:NERDTreeToggle<cr>
vnoremap <silent><F2> <ESC>:NERDTreeToggle<cr>
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.swp$', '\~$']

"Yankring shortcuts
nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>

"CtrlP default open on new tab, reverse it with the default mapping
let g:ctrlp_prompt_mappings = {
            \'AcceptSelection("e")' : ['<c-t>'],
            \'AcceptSelection("t")' : ['<cr>'],
\}
nnoremap <silent><leader>f :CtrlP<cr>

" [git-scm-breeze] Show the git repository status of the currently active file
function! GitStatus()
    !clear && cd %:p:h && clear && echo %:p:h && git_status_shortcuts
endfunction

" [git-scm-breeze] add the currently edited file to the list of commited changes
" and immediately enter the commit messages
" this is only meant for quick fixing of a single file
function! GitAddAndCommitSingle()
    !clear && cd %:p:h && clear && echo %:p:h && git_add_and_commit %:p
endfunction

" [git-scm-breeze] add all new and edited files for commit
" and immediately enter the commit messages
function! GitAddAndCommitAll()
    !clear && cd %:p:h && git_add_shortcuts 1-9999 && clear && echo %:p:h && git_add_and_commit 1-9999
endfunction

nnoremap <leader>gs :call GitStatus()<cr>
nnoremap <leader>gc :call GitAddAndCommitSingle()<cr>
nnoremap <leader>ga :call GitAddAndCommitAll()<cr>

"-----------------------------------------------------------------
"Python specific configuration
"-----------------------------------------------------------------

"Add comment block
nnoremap <leader>pc <S-o>"""<CR><CR>"""<ESC>ki

nnoremap <S-k> <ESC>
nnoremap <S-K> <ESC>
