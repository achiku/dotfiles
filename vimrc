" =============================
" neobundle settings
" =============================
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/chiku/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('/Users/chiku/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" =============================
" plugins
" =============================
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'cocopon/lightline-hybrid.vim'
" NeoBundle 'fisadev/vim-isort'
" NeoBundle 'scrooloose/nerdtree'
" NeoBundle 'majutsushi/tagbar'
" NeoBundle 'kien/ctrlp.vim'
" NeoBundle 'thinca/vim-quickrun'
" NeoBundle 'Shougo/neosnippet.vim'
" NeoBundle 'Shougo/neosnippet-snippets'
" NeoBundle 'Shougo/neocomplete'
NeoBundle 'fuenor/qfixhowm'
NeoBundle 'kana/vim-fakeclip'
NeoBundle 'miyakogi/vim-virtualenv'
" NeoBundle 'cespare/vim-toml'
NeoBundle 'achiku/memolist.vim'
NeoBundle 'arecarn/vim-crunch'
" NeoBundle 'arecarn/vim-selection'

"" Colors
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'dylanaraps/crayon'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle '29decibel/codeschool-vim-theme'
NeoBundle 'rhysd/vim-color-spring-night'


" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

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

autocmd Filetype html setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype jade setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype scss setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype jinja setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype j2 setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype css setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype js setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype coffee setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype hql setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype sql setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2
" autocmd MyAutoGroup BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown

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

"" custom syntax highlight
au BufRead,BufNewFile *.hql  set filetype=hive

nmap <silent> <Esc><Esc> :nohlsearch<CR>
nnoremap j gj
nnoremap k gk

"" tab settings
nnoremap tt :<C-u>tabnew<CR>
nnoremap tn gt
nnoremap tp gr


"" = - ~ " ' ` for HTML section
nnoremap <silent> <space># yyp<c-v>$r#
nnoremap <silent> <space>= yyp<c-v>$r=
nnoremap <silent> <space>- yyp<c-v>$r-
nnoremap <silent> <space>~ yyp<c-v>$r~
nnoremap <silent> <space>" yyp<c-v>$r"
nnoremap <silent> <space>' yyp<c-v>$r'
nnoremap <silent> <space>` yyp<c-v>$r`

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


"" qfixhowm
" add runtimepath
set runtimepath+=~/.vim/bundle/qfixapp

" keymap
let QFixHowm_Key = 'g'

" " howm_dir is where we save howm files
let howm_dir = '~/Documents/howm/achiku'
let QFixHowm_Title = '# '
" let howm_dir = '~/Dropbox/share-system/akira.chiku/'
let howm_filename = '%Y/%m/%Y-%m-%d-%H%M%S.md'
let howm_fileencoding = 'utf-8'
let QFixHowm_FileType = 'markdown'
let howm_fileformat = 'unix'
let QFixMRU_Filename = '~/Documents/howm/qfixmru'
let QFixMRU_EntryMax = 300
let QFixMRU_Entries = 300
let QFixHowm_FilenameLen = 0
let QFixHowm_Template = [
  \"# %TAG%",
  \""
  \]
let QFixHowm_SaveTime = 2
let QFixHowm_RecentMode = 2
let QFixHowm_Autoformat = 0
let calendar_jp = 1

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
