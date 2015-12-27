" =============================
" neobundle settings
" =============================
"Python3 support
let g:python3_host_prog = expand('$HOME') . '/.virtualenvs/py3/bin/python3'
if has('vim_starting')
    set runtimepath+=~/.config/nvim/neobundle.vim/
endif

call neobundle#begin(expand('~/.config/nvim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }


" =============================
" plugins
" =============================
NeoBundle 'Shougo/deoplete.nvim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'cocopon/lightline-hybrid.vim'
NeoBundle 'vim-scripts/dbext.vim', '18.0'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'fisadev/vim-isort'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'nixprime/cpsm'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'groenewege/vim-less'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'autowitch/hive.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'janko-m/vim-test'
NeoBundle 'kassio/neoterm'
NeoBundle 'Glench/Vim-Jinja2-Syntax'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vim-scripts/SQLUtilities'
NeoBundle 'kana/vim-fakeclip'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'fatih/vim-go'
NeoBundle 'chase/vim-ansible-yaml'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'miyakogi/vim-virtualenv'
" NeoBundle 'jmcantrell/vim-virtualenv'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'cespare/vim-toml'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'kannokanno/previm'


"" Colors
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'dylanaraps/crayon'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle '29decibel/codeschool-vim-theme'


call neobundle#end()
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

set nobackup
set nowritebackup
set noswapfile
set noundofile

set hlsearch
set clipboard=unnamed

set textwidth=0
set laststatus=2

set lazyredraw

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

command! -nargs=* -bar -bang -count=0 -complete=dir Ex Explore <args>

"=================================
" plugin settings
"=================================

"" lightline
source ~/.config/nvim/etc/lightline.vim


"" synatastic
" let g:syntastic_debug = 1
let g:syntastic_check_on_open = 1
let g:syntastic_python_checkers = ['flake8', 'pep257', 'mypy']
" let g:syntastic_python_checkers = ['flake8', 'mypy']
let g:syntastic_python_flake8_args = '--max-line-length=120'
let g:syntastic_python_pep257_args = '--ignore=D100,D302,D400,D401,D211'
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_coffee_checkers = ['coffeelint']
let g:syntastic_coffee_coffeelint_args = '--csv --file ' . $HOME . '/.coffeelintrc'
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

nmap <silent><Leader>ee <Esc>:Errors<CR>


"" ctrlp
" let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
" let g:ctrlp_user_command = 'files -a %s'

set wildignore+=**/tmp/,*.so,*.swp,*.zip,*.pyc,htmlcov,__pycache__
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|htmlcov|node_modules|DS_Store)$',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

nnoremap s <Nop>
nnoremap sa :<C-u>CtrlP<Space>
nnoremap sb :<C-u>CtrlPBuffer<CR>
nnoremap sd :<C-u>CtrlPDir<CR>
nnoremap sf :<C-u>CtrlP<CR>
nnoremap sl :<C-u>CtrlPLine<CR>
nnoremap sm :<C-u>CtrlPMRUFiles<CR>
nnoremap sq :<C-u>CtrlPQuickfix<CR>
nnoremap ss :<C-u>CtrlPMixed<CR>
nnoremap st :<C-u>CtrlPTag<CR>

let g:ctrlp_map = '<Nop>'
" Guess vcs root dir
let g:ctrlp_working_path_mode = 'ra'
" Open new file in current window
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_extensions = ['tag', 'quickfix', 'dir', 'line', 'mixed']
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:18'
" let g:ctrlp_by_filename = 1 " フルパスではなくファイル名のみで絞込み
let g:ctrlp_jump_to_buffer = 2 " タブで開かれていた場合はそのタブに切り替える
let g:ctrlp_clear_cache_on_exit = 0 " 終了時キャッシュをクリアしない
let g:ctrlp_mruf_max = 10000 " MRUの最大記録数
let g:ctrlp_highlight_match = [1, 'IncSearch'] " 絞り込みで一致した部分のハイライト
let g:ctrlp_open_new_file = 1 " 新規ファイル作成時にタブで開く
let g:ctrlp_open_multi = '10t' " 複数ファイルを開く時にタブで最大10まで開く


"" tagbar
nmap <F9> :TagbarToggle<CR>

"" nerdtree
nmap <F8> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', 'node_modules$']

" vim_goshrepl
vmap <CR> <Plug>(gosh_repl_send_block)

""" dbext.vim
let g:dbext_default_history_file =  '~/.vim/bundle/dbext'
source ~/.vim/etc/dbext.vim


""" neosnippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<TAB>" : "\<Plug>(neosnippet_expand_or_jump)"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'


"" vim-indent-guides
" vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=2
" 自動カラーを無効にする
let g:indent_guides_auto_colors=0
" 奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=236
" 偶数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=238
" ハイライト色の変化の幅
let g:indent_guides_color_change_percent = 30
" ガイドの幅
let g:indent_guides_guide_size = 1


""" vim-test
"function! SplitStrategy(cmd)
"  botright new | call termopen(a:cmd)
"endfunction
"
"let g:test#custom_strategies = {'terminal_split': function('SplitStrategy')}
"let g:test#strategy = 'terminal_split'
let g:test#strategy = 'neoterm'

" for pytest-django
" nmap <silent> <leader>pf :TestNearest --reuse-db<CR>
" nmap <silent> <leader>pfn :TestNearest --create-db<CR>
" nmap <silent> <leader>pi :TestFile --reuse-db<CR>
" nmap <silent> <leader>pin :TestFile --create-db<CR>

nmap <silent> <leader>f :TestNearest<CR>
nmap <silent> <leader>i :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

let test#python#pytest#options = {
  \ 'nearest': '--verbose',
  \ 'file':    '--verbose',
  \ 'suite':   '--verbose',
\}
let test#go#gotest#options = {
  \ 'nearest': '-v',
  \ 'file':    '-v',
  \ 'suite':   '-v',
\}


""" SQLFormatter
vmap <silent>sf <Plug>SQLU_Formatter<CR>
nmap <silent>scl <Plug>SQLU_CreateColumnList<CR>
nmap <silent>scd <Plug>SQLU_GetColumnDef<CR>
nmap <silent>scdt <Plug>SQLU_GetColumnDataType<CR>
nmap <silent>scp <Plug>SQLU_CreateProcedure<CR>


""" jedi-vim
" jediにvimの設定を任せると'completeopt+=preview'するので
" 自動設定機能をOFFにし手動で設定を行う
autocmd FileType python setlocal completeopt-=preview
let g:jedi#force_py_version = 3
let g:jedi#popup_select_first = 0
" quickrunと被るため大文字に変更
let g:jedi#rename_command = '<Leader>R'
" 補完の最初の項目が選択された状態だと使いにくいためオフにする
let g:jedi#popup_select_first = 0
let g:jedi#popup_on_dot = 0
autocmd FileType python setlocal omnifunc=jedi#completions

""" vim-virtualenv
let g:virtualenv_auto_activate = 1
let g:virtualenv_stl_format = '[%n]'


""" quickrun
" runner/vimproc/updatetime で出力バッファの更新間隔をミリ秒で設定可能
" updatetime が一時的に書き換えられてしまうので注意
let g:quickrun_config = {
\   "_" : {
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 60,
\   },
\   'objc': {
\     'command': 'cc',
\     'exec': ['%c %s -o %s:p:r -framework Foundation', '%s:p:r %a', 'rm -f %s:p:r'],
\     'tempfile': '{tempname()}.m',
\   }
\}


""" vim-go
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_term_enabled = 1
let g:go_highlight_build_constraints = 1

augroup GolangSettings
    autocmd!
    autocmd FileType go nmap <leader>gb <Plug>(go-build)
    " autocmd FileType go nmap <leader>gt :<C-u>GoTest<CR>
    autocmd FileType go nmap <leader>gt <Plug>(go-test)
    autocmd FileType go nmap <Leader>ds <Plug>(go-def-split)
    autocmd FileType go nmap <Leader>dv <Plug>(go-def-vertical)
    autocmd FileType go nmap <Leader>dt <Plug>(go-def-tab)
    autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
    autocmd FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
augroup END


""" isort-vim
let g:vim_isort_map = '<C-i>'


""" previm
let g:previm_open_cmd = 'open -a Google\ Chrome '
let g:previm_custom_css_path = '/Users/achiku/.vim/etc/previm.css'
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END


""" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

inoremap <expr><C-h> deolete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"
