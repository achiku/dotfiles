" =============================
" vim-plug settings
" =============================
"
call plug#begin('~/.config/nvim/plugged')

"Python3 support
let g:python3_host_prog = expand('$HOME') . '/venv/bin/python'

" =============================
" plugins
" =============================
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"Plug 'lighttiger2505/deoplete-vim-lsp'
Plug 'itchyny/lightline.vim'
Plug 'cocopon/lightline-hybrid.vim'
" Plug 'vim-scripts/dbext.vim', '18.0'
Plug 'jmcantrell/vim-virtualenv'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nixprime/cpsm'
" Plug 'kchmck/vim-coffee-script'
" Plug 'groenewege/vim-less'
Plug 'thinca/vim-quickrun'
" Plug 'autowitch/hive.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'janko-m/vim-test'
Plug 'kassio/neoterm'
"" Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'kana/vim-fakeclip'
Plug 'Raimondi/delimitMate'
" Plug 'zchee/deoplete-go', {'build': {'unix': 'make'}}
Plug 'fatih/vim-go'
" Plug 'pearofducks/ansible-vim'
" Plug 'davidhalter/jedi-vim'
" Plug 'hynek/vim-python-pep8-indent'
" Plug 'cespare/vim-toml'
" Plug 'editorconfig/editorconfig-vim'
" Plug 'kannokanno/previm'
" Plug 'metakirby5/codi.vim'
" Plug 'tell-k/vim-autopep8'
Plug 'w0rp/ale'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
"" Plug 'b4b4r07/vim-sqlfmt'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

"" uml
Plug 'scrooloose/vim-slumlord'
Plug 'aklt/plantuml-syntax'

"" elixir
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
" Plug 'awetzel/elixir.nvim'

"" haskell
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'
Plug 'dag/vim2hs'

"" javascript/typescript + react
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'

"" Colors
" Plug 'w0ng/vim-hybrid'
" Plug 'dylanaraps/crayon'
" Plug 'nanotech/jellybeans.vim'
" Plug '29decibel/codeschool-vim-theme'
Plug 'morhetz/gruvbox'
" Plug 'roosta/srcery'
" Plug 'jacoborus/tender'
" Plug 'mhartington/oceanic-next'


call plug#end()

"=================================
" vim settings
"=================================
syntax on
colorscheme gruvbox
set background=dark    " Setting dark mode

set nofoldenable
set number
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

autocmd Filetype yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype vim setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype html setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype scss setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype jinja setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype css setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype sql setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype javascriptreact setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype typescript setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype typescriptreact setlocal tabstop=2 softtabstop=2 shiftwidth=2

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

nnoremap <silent> <Esc><Esc> :nohlsearch<CR>
nnoremap j gj
nnoremap k gk

"" tab settings
nnoremap tt :<C-u>tabnew<CR>
nnoremap tn gt
nnoremap tp gT


"" = - ~ " ' ` for HTML section
nnoremap <silent> <space># yyp<c-v>$r#
nnoremap <silent> <space>= yyp<c-v>$r=
nnoremap <silent> <space>- yyp<c-v>$r-
nnoremap <silent> <space>~ yyp<c-v>$r~
nnoremap <silent> <space>" yyp<c-v>$r"
nnoremap <silent> <space>' yyp<c-v>$r'
nnoremap <silent> <space>` yyp<c-v>$r`

nnoremap <space>. :<C-u>edit $MYVIMRC<CR>
nnoremap <space>% :<C-u>source $MYVIMRC<CR>

command! -nargs=* -bar -bang -count=0 -complete=dir Ex Explore <args>

"=================================
" plugin settings
"=================================

"" lightline
source ~/.config/nvim/etc/lightline.vim


"" ctrlp
" let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
" let g:ctrlp_user_command = "pt --nocolor -g '\\*' %s"
" let g:ctrlp_user_command = 'files -a %s'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
set wildignore+=**/tmp/,*.so,*.swp,*.zip,*.pyc,htmlcov,__pycache__
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|htmlcov|node_modules|DS_Store)$',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

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


"" tagbar
nnoremap <F9> :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_width = 45

"" nerdtree
nnoremap <F8> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', 'node_modules$']

" vim_goshrepl
vmap <CR> <Plug>(gosh_repl_send_block)

""" dbext.vim
let g:dbext_default_history_file =  '~/.config/nvim/bundle/dbext_history.sql'
source ~/.config/nvim/etc/dbext_config.vim


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

"" neoterm
let g:neoterm_size = 15
let g:neoterm_default_mod = 'belowright'



""" vim-test
"function! SplitStrategy(cmd)
"  botright new | call termopen(a:cmd)
"endfunction
"
" let g:test#custom_strategies = {'terminal_split': function('SplitStrategy')}
" let g:test#strategy = 'terminal_split'
let g:test#strategy = 'neoterm'
" let g:test#strategy = 'asyncrun'
" let g:test#strategy = 'neovim'
let g:test#preserve_screen = 0

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

" let test#python#runner = 'djangotest'

let test#python#pytest#options = {
  \ 'nearest': '-v',
  \ 'file':    '-v',
  \ 'suite':   '-v',
\}
let test#go#gotest#options = {
  \ 'nearest': '-v',
  \ 'file':    '-v',
  \ 'suite':   '-v',
\}



""" jedi-vim
" jediにvimの設定を任せると'completeopt+=preview'するので
" 自動設定機能をOFFにし手動で設定を行う
" autocmd FileType python setlocal completeopt-=preview
" let g:jedi#force_py_version = 3
" let g:jedi#popup_select_first = 0
" quickrunと被るため大文字に変更
" let g:jedi#rename_command = '<Leader>R'
" 補完の最初の項目が選択された状態だと使いにくいためオフにする
" let g:jedi#popup_select_first = 0
" let g:jedi#popup_on_dot = 0
" autocmd FileType python setlocal omnifunc=jedi#completions

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


"" vim-go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1

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
  autocmd FileType go :highlight goErr cterm=bold ctermfg=214
  autocmd FileType go :match goErr /\<err\>/
augroup END

""" deoplete-go
" let g:deoplete#sources#go#align_class = 1
" let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
" let g:deoplete#sources#go#package_dot = 1

""" previm
let g:previm_show_header = 0
let g:previm_enable_realtime = 1
let g:previm_open_cmd = 'open -a Google\ Chrome '
" let g:previm_custom_css_path = '/Users/achiku/.vim/etc/previm.css'
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END


""" deoplete
let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_smart_case = 1
" let g:deoplete#auto_complete_delay = 1
" let g:deoplete#auto_complete_start_length = 1
" let g:deoplete#enable_camel_case = 0
" let g:deoplete#enable_ignore_case = 0
" let g:deoplete#enable_refresh_always = 0
" let g:deoplete#file#enable_buffer_path = 1
" let g:deoplete#max_list = 10000

" inoremap <expr><C-h> deolete#mappings#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"


""" vim2hs
let g:haskell_conceal_wide = 1


""" ghcmod-vim
autocmd BufWritePost *.hs GhcModCheckAndLintAsync


""" elixir.nvim
let g:elixir_showerror = 1
let g:elixir_autobuild = 1


""" ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 0

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_sign_column_always = 1

let g:ale_fixers = {
\   'python': ['isort'],
\}

let g:ale_linter_aliases = {'typescriptreact': 'typescript'}
let g:ale_linters = {
\   'javascript': ['eslint', 'flow'],
\   'python': ['flake8', 'isort', 'mypy'],
\   'typescript': ['eslint'],
\}

let g:ale_python_flake8_options = '--max-line-length=120'

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'


"" vim-jsx
let g:jsx_ext_required = 0

"" sqlfmt
let g:sqlfmt_command = "sqlformat"
let g:sqlfmt_options = "-r -k lower --comma_first True -"


"" vim-lsp
let g:lsp_diagnostics_enabled = 0
