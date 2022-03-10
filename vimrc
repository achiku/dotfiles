" =============================
" vim-plug settings
" =============================

call plug#begin('~/.vim/plugged')

"Python3 support
let g:python3_host_prog = expand('$HOME') . '/venv/bin/python'

" =============================
" plugins
" =============================
Plug 'itchyny/lightline.vim'
Plug 'cocopon/lightline-hybrid.vim'
Plug 'Raimondi/delimitMate'
Plug 'kana/vim-fakeclip'
Plug 'miyakogi/vim-virtualenv'
Plug 'achiku/memolist.vim'
Plug 'arecarn/vim-crunch'

"" Colors
" Plug 'w0ng/vim-hybrid'
" Plug 'dylanaraps/crayon'
Plug 'nanotech/jellybeans.vim'
" Plug '29decibel/codeschool-vim-theme'
" Plug 'rhysd/vim-color-spring-night'


call plug#end()

"=================================
" vim settings
"=================================
syntax on
set t_Co=256
colorscheme jellybeans

set nofoldenable
set number
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

set nobackup
set nowritebackup
set noswapfile
set noundofile

set hlsearch
set clipboard=unnamed

set textwidth=0
set laststatus=2

set lazyredraw
set ttyfast
set nocursorline
set nocursorcolumn

"" custom syntax highlight
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

"" wrap
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k

"" quick edit
nnoremap <Space>. :<C-u>edit $MYVIMRC<CR>
nnoremap <Space>% :<C-u>source $MYVIMRC<CR>

"=================================
" plugin settings
"=================================

"" lightline
" source ~/.vim/etc/lightline.vim

"" netrw
let g:netrw_sort_direction = 'reverse'
let g:netrw_fastbrowse = 2

"" memolist
nnoremap <Space>c :<C-u>MemoNew<CR>
nnoremap <Space>l :<C-u>MemoList<CR>
" nnoremap <Leader>mn  :MemoNew<CR>
" nnoremap <Leader>ml  :MemoList<CR>
nnoremap <Leader>mg  :MemoGrep<CR>

let g:memolist_path = "~/Documents/memolist/achiku"
let g:memolist_memo_suffix = "md"
" let g:memolist_vimfiler = 1

" date format (default %Y-%m-%d %H:%M)
" let g:memolist_memo_date = "%Y-%m-%d-%H:%M:%S"
let g:memolist_template_dir_path = "~/Documents/memolist"

""" vim-crunch
let g:crunch_precision = 10
