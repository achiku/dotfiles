" =============================
" neobundle settings
" =============================
if has('vim_starting')
    set nocompatible               " Be iMproved
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'

" =============================
" plugins
" =============================
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'vim-scripts/dbext.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'w0ng/vim-hybrid'

filetype plugin indent on     " Required!

" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck


"=================================
" vim settings
"=================================
syntax on
set t_Co=256
colorscheme desert256

set number
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

set nowritebackup                                                               
set nobackup                                                                    
set noswapfile

set hlsearch


"=================================
" individual plugin settings
"=================================
"" synatastic
let g:syntastic_check_on_open=1                                                 
let g:syntastic_python_checkers=['flake8', 'pyflakes']
let g:syntastic_python_checker_args='--ignore=E501'

"" neocomplcache.vim
" Disable AutoComplPop.
let g:acp_enableAtStartup=0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup=1
" Use smartcase.
let g:neocomplcache_enable_smart_case=1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length=3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

"" qfixhowm
" add runtimepath
set runtimepath+=~/.vim/bundle/qfixapp

" keymap
let QFixHowm_Key = 'g'

" " howm_dir is where we save howm files
let howm_dir             = '~/Documents/howm/'
let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.txt'
let howm_fileencoding    = 'utf-8'
let howm_fileformat      = 'unix'
let QFixMRU_Filename     = '~/.qfixmru'

