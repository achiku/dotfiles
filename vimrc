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
NeoBundle 'cocopon/lightline-hybrid.vim'
NeoBundle 'vim-scripts/dbext.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'groenewege/vim-less'
NeoBundle 'aharisu/vim_goshrepl'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'autowitch/hive.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'
NeoBundle 'godlygeek/tabular'
NeoBundle 'Rykka/riv.vim'
NeoBundle 'fuenor/qfixhowm'
NeoBundle 'alfredodeza/pytest.vim'
NeoBundle 'Glench/Vim-Jinja2-Syntax'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vim-scripts/SQLUtilities'
NeoBundle 'vim-scripts/Align'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'



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
set term=screen-256color
colorscheme hybrid

set number
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

autocmd Filetype html setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype jinja setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype css setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype js setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype coffee setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype hql setlocal tabstop=2 softtabstop=2 shiftwidth=2

set nobackup
set nowritebackup
set noswapfile

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
"" synatastic
let g:syntastic_check_on_open=1
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args = '--max-line-length=120'

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


"" ctlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules)$',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ }


"" qfixhowm
" add runtimepath
set runtimepath+=~/.vim/bundle/qfixapp

" keymap
let QFixHowm_Key = 'g'

" " howm_dir is where we save howm files
let howm_dir             = '~/Documents/howm/'
" let howm_dir = '~/Dropbox/share-system/akira.chiku/'
let howm_filename = '%Y/%m/%Y-%m-%d-%H%M%S.rst'
let howm_fileencoding = 'utf-8'
let howm_fileformat = 'unix'
let QFixMRU_Filename = '~/.qfixmru'
let QFixMRU_EntryMax = 300
let QFixMRU_Entries = 30
let QFixHowm_FilenameLen = 0
let QFixHowm_Template = [
  \"= %TAG%",
  \""
  \]
let QFixHowm_SaveTime = 1
let QFixHowm_Autoformat = 0
" カレンダー表示の日本語化
let calendar_jp = 1


"" tagbar
nmap <F9> :TagbarToggle<CR>

"" nerdtree
nmap <F8> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', 'node_modules$']

" vim_goshrepl
vmap <CR> <Plug>(gosh_repl_send_block)

"" dbext.vim
" sqlite
let g:dbext_default_history_file =  '/Users/achiku/.vim/bundle/dbext'


"" neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets,~/.vim/snippets'


"" Tabular
" see@ https://gist.github.com/tpope/287147
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
 
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

"" Riv.vim
let g:riv_fold_auto_update = 0
set nofoldenable

"" vim-indent-guides
" vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup=1
" " ガイドをスタートするインデントの量
let g:indent_guides_start_level=2
" " 自動カラーを無効にする
let g:indent_guides_auto_colors=0
" " 奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=236
" " 偶数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=238
" " ハイライト色の変化の幅
let g:indent_guides_color_change_percent = 30
" " ガイドの幅
let g:indent_guides_guide_size = 1

""" Binding for Pytest
" ファイル全体に py.test を実行
nmap <silent><Leader>pi <Esc>:Pytest file<CR>
" " フォーカスのあたってるクラスに py.test を実行
nmap <silent><Leader>pc <Esc>:Pytest class<CR>
" " フォーカスのあたってるメソッドに py.test を実行
nmap <silent><Leader>pm <Esc>:Pytest method<CR>
" " フォーカスのあたってる関数に py.test を実行
nmap <silent><Leader>pf <Esc>:Pytest function<CR>
" " エラーメッセージなどのログウィンドウ表示をトグル
nmap <silent><Leader>ps <Esc>:Pytest session<CR>


"" SQL Formatter
vmap <silent>sf <Plug>SQLU_Formatter<CR>
nmap <silent>scl <Plug>SQLU_CreateColumnList<CR>
nmap <silent>scd <Plug>SQLU_GetColumnDef<CR>
nmap <silent>scdt <Plug>SQLU_GetColumnDataType<CR>
nmap <silent>scp <Plug>SQLU_CreateProcedure<CR>
