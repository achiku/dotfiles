" =============================
" neobundle settings
" =============================
if has('vim_starting')
    set nocompatible               " Be iMproved
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

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
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'cocopon/lightline-hybrid.vim'
NeoBundle 'vim-scripts/dbext.vim', '18.0'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'fisadev/vim-isort'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'groenewege/vim-less'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'autowitch/hive.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'fuenor/qfixhowm'
NeoBundle 'alfredodeza/pytest.vim'
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
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'cespare/vim-toml'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'kannokanno/previm'

"" Colors
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'dylanaraps/crayon'
NeoBundle 'nanotech/jellybeans.vim'


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
set t_Co=256
colorscheme jellybeans

set nofoldenable
set number
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

autocmd Filetype html setlocal tabstop=2 softtabstop=2 shiftwidth=2
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
source ~/.vim/etc/lightline.vim


"" synatastic
" let g:syntastic_debug = 1
let g:syntastic_check_on_open = 1
let g:syntastic_python_checkers = ['flake8', 'pep257']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_flake8_args = '--max-line-length=120'
let g:syntastic_python_pep257_args = '--ignore=D100,D302,D400,D401'
let g:syntastic_coffee_checkers = ['coffeelint']
let g:syntastic_coffee_coffeelint_args = '--csv --file ' . $HOME . '/.coffeelintrc'
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
nmap <silent><Leader>ee <Esc>:Errors<CR>


"" ctlp
set wildignore+=**/tmp/,*.so,*.swp,*.zip,*.pyc,htmlcov,__pycache__
let g:ctrlp_custom_ignore = 'htmlcov\|git\|node_modules\|DS_Store\|*.pyc'
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
let QFixHowm_SaveTime = 1
let QFixHowm_Autoformat = 0
let calendar_jp = 1


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
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/snippets'


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


""" pytest.vim
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


""" SQLFormatter
vmap <silent>sf <Plug>SQLU_Formatter<CR>
nmap <silent>scl <Plug>SQLU_CreateColumnList<CR>
nmap <silent>scd <Plug>SQLU_GetColumnDef<CR>
nmap <silent>scdt <Plug>SQLU_GetColumnDataType<CR>
nmap <silent>scp <Plug>SQLU_CreateProcedure<CR>


""" Kobito
function! s:open_kobito(...)
    if a:0 == 0
        call system('open -a Kobito '.expand('%:p'))
    else
        call system('open -a Kobito '.join(a:000, ' '))
    endif
endfunction
" 引数のファイル(複数指定可)を Kobitoで開く
" （引数無しのときはカレントバッファを開く
command! -nargs=* Kobito call s:open_kobito(<f-args>)
" Kobito を閉じる
command! -nargs=0 KobitoClose call system("osascript -e 'tell application \"Kobito\" to quit'")
" Kobito にフォーカスを移す
command! -nargs=0 KobitoFocus call system("osascript -e 'tell application \"Kobito\" to activate'")


""" neocomplete
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Invalidate auto-complete
let g:neocomplete#disable_auto_complete = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <expr><C-n> neocomplete#start_manual_complete()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"


""" jedi-vim
" jediにvimの設定を任せると'completeopt+=preview'するので
" 自動設定機能をOFFにし手動で設定を行う
autocmd FileType python setlocal completeopt-=preview
let g:jedi#popup_on_dot = 0
let g:jedi#auto_vim_configuration = 0
" 補完の最初の項目が選択された状態だと使いにくいためオフにする
let g:jedi#popup_select_first = 0
" quickrunと被るため大文字に変更
let g:jedi#rename_command = '<Leader>R'

autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType python let g:neocomplete#disable_auto_complete = 0
 
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif

" let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'




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


""" go-vim
autocmd FileType go let g:neocomplete#disable_auto_complete = 0

let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

autocmd FileType go nmap <leader>gb <Plug>(go-build)
autocmd FileType go nmap <leader>gt <Plug>(go-test)
autocmd FileType go nmap <Leader>ds <Plug>(go-def-split)
autocmd FileType go nmap <Leader>dv <Plug>(go-def-vertical)
autocmd FileType go nmap <Leader>dt <Plug>(go-def-tab)
autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
autocmd FileType go nmap <Leader>gv <Plug>(go-doc-vertical)


""" isort-vim
let g:vim_isort_map = '<C-i>'


""" previm
let g:previm_open_cmd = 'open -a Google\ Chrome '
let g:previm_custom_css_path = '/Users/achiku/.vim/etc/previm.css'
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
