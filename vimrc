set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'vim-scripts/L9'
Bundle 'kevinw/pyflakes-vim' 
Bundle 'chriskempson/base16-vim' 
Bundle 'vim-scripts/FuzzyFinder'
Bundle 'git://github.com/tpope/vim-fugitive.git'
Bundle 'git://github.com/tpope/vim-abolish.git'
Bundle 'git://github.com/tpope/vim-commentary.git'
Bundle 'git://github.com/Lokaltog/vim-powerline.git'
Bundle 'git://github.com/Lokaltog/vim-easymotion.git'
Bundle 'git://github.com/airblade/vim-gitgutter.git'
Bundle 'git://github.com/Shougo/neocomplcache.vim.git'
Bundle 'git://github.com/terryma/vim-multiple-cursors.git'
Bundle 'git://github.com/terryma/vim-expand-region.git'
Bundle 'git://github.com/kecebongsoft/vim-github-colorscheme.git'

filetype plugin indent on
syntax enable "Enable syntax highlighting
set nomore ttyfast expandtab ignorecase showmode showcmd nohidden wildmenu cursorline ruler undofile number smartcase gdefault incsearch showmatch hlsearch lazyredraw splitright splitbelow ttimeout notimeout nottimeout autoindent shiftround autoread nobackup wrap list
set shell=/bin/bash tabstop=4 shiftwidth=4 softtabstop=4 laststatus=2 linespace=1 scrolloff=3 history=100 undoreload=10000 scrolljump=8 matchtime=3  modelines=0 encoding=utf-8 textwidth=72 colorcolumn=80 clipboard=unnamed background=dark
set showbreak=↪ 
set wildmode=list:longest "Show full item on the dropdown
set fillchars=diff:\  "Show latest changed stuff in the status line when available
set dictionary=/usr/share/dict/words "Dictionary, also used for completion
set formatoptions=qrn1 "Format for pasting text
set listchars=tab:▸\ ,extends:❯,precedes:❮ "Substite hidden characters
set guioptions-=mT guioptions+=LlRrb guioptions-=LlRrb
set wildignore+=.hg,.git,.svn,*.aux,*.out,*.toc,*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.luacd,*.o,*.obj,*.exe,*.dll,*.manifest,*.pyc,*.spl,*.sw?,*.DS_Store?,*.class
set backupskip=/tmp/*,/private/tmp/*" "Skip backup in these dirs
set dir=~/.vim/swaps//,/var/tmp//,/tmp//,. "Set swap dir
set undodir=~/.vim/undos//,/var/tmp//,/tmp//,. "Set undo dir
set guifont=MonacoB2:h11
colorscheme base16-flat

let mapleader ="," "Leader key
inoremap jk <ESC>
nnoremap j gj
nnoremap k gk

"Insert blank line above/below cursors
nnoremap zj :set paste<CR>m`o<Esc>``:set nopaste<CR> 
nnoremap zk :set paste<CR>m`O<Esc>``:set nopaste<CR>

"Remove whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"Clear highlighted match
nnoremap <silent><leader><space> :noh<cr>

cmap w!! %!sudo tee > /dev/null %
nnoremap <silent><leader>r :w !python<cr>
nnoremap <silent><leader>t :w !bash<cr>
inoremap <silent><C-j> <ESC>:execute 'silent! tabmove ' . (tabpagenr()-2)<cr>
inoremap <silent><C-k> <ESC>:execute 'silent! tabmove ' . tabpagenr()<cr>
inoremap <silent><C-l> <ESC>:tabnext<cr>
inoremap <silent><C-h> <ESC>:tabprevious<cr>
nnoremap <silent><C-j> :execute 'silent! tabmove ' . (tabpagenr()-2)<cr>
nnoremap <silent><C-k> :execute 'silent! tabmove ' . tabpagenr()<cr>
nnoremap <silent><C-l> :tabnext<cr>
nnoremap <silent><C-h> :tabprevious<cr>

" Paste and move cursor to the end of the line 
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Visual select the just-pasted text
noremap gV `[v`]

"Fast edit and reload vimrc
nnoremap <leader>ev :tabnew ~/.vimrc<cr>
nnoremap <leader>er :source ~/.vimrc<cr>

" Disable man page shortcut
nnoremap <S-k> <ESC>
nnoremap <silent><leader>j :FufRenewCache<CR>:FufFile<CR>
nnoremap <silent><leader>b :FufBuffer<CR>
let g:fuf_file_exclude = 'v\~$|\.pyc$|\.orig$|\.bak$|\.swp$|\.swo$'
let g:fuf_keyOpenTabpage = '<CR>'
let g:fuf_keyOpenSplit = '<C-i>'
nnoremap <silent><leader>g :Gstatus<cr>
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END


