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
Plug 'itchyny/lightline.vim'
Plug 'cocopon/lightline-hybrid.vim'
Plug 'jmcantrell/vim-virtualenv'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nixprime/cpsm'
Plug 'thinca/vim-quickrun'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'janko-m/vim-test'
Plug 'kassio/neoterm'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'kana/vim-fakeclip'
Plug 'Raimondi/delimitMate'
Plug 'fatih/vim-go'
Plug 'cespare/vim-toml'
Plug 'tell-k/vim-autopep8'
Plug 'w0rp/ale'
Plug 'google/vim-jsonnet'

"" json
Plug 'elzr/vim-json'

"" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

"" sql
" Plug 'vim-scripts/dbext.vim', '18.0'

"" uml
" Plug 'scrooloose/vim-slumlord'
" Plug 'aklt/plantuml-syntax'

"" elixir
" Plug 'elixir-lang/vim-elixir'
" Plug 'slashmili/alchemist.vim'
" Plug 'awetzel/elixir.nvim'

"" haskell
" Plug 'eagletmt/ghcmod-vim'
" Plug 'eagletmt/neco-ghc'
" Plug 'dag/vim2hs'

"" javascript/typescript + react
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'prisma/vim-prisma'
" Plug 'HerringtonDarkholme/yats.vim'

"" Colors
" Plug 'w0ng/vim-hybrid'
" Plug 'dylanaraps/crayon'
" Plug 'nanotech/jellybeans.vim'
" Plug '29decibel/codeschool-vim-theme'
Plug 'morhetz/gruvbox'
" Plug 'roosta/srcery'
" Plug 'jacoborus/tender'
" Plug 'mhartington/oceanic-next'

"" hashi corp
Plug 'jvirtanen/vim-hcl'

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
set ttyfast
set nocursorline
set nocursorcolumn

nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

""" wrap
nnoremap j gj
nnoremap k gk

"" tab settings
nnoremap tt :<C-u>tabnew<CR>
nnoremap tn gt
nnoremap tp gT

"" quick edit
nnoremap <space>. :<C-u>edit $MYVIMRC<CR>
nnoremap <space>% :<C-u>source $MYVIMRC<CR>

"=================================
" plugin settings
"=================================

"" lightline
source ~/.config/nvim/etc/lightline.vim


"" ctrlp
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" let g:ctrlp_match_func = {'match': 'ctrlp_matchfuzzy#matcher'}
" let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
set wildignore+=**/tmp/,*.so,*.swp,*.zip,*.pyc,htmlcov,__pycache__
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|htmlcov|node_modules|DS_Store|venv)$',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
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
let g:ctrlp_use_caching = 1
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

"" vim-json
let g:vim_json_syntax_conceal = 0

"" tagbar
nnoremap <F9> :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_width = 45


"" nerdtree
nnoremap <F8> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', 'node_modules$']


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
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=238
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1


"" neoterm
let g:neoterm_size = 15
let g:neoterm_default_mod = 'belowright'


""" vim-test
let g:test#strategy = 'neoterm'
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

""" vim-virtualenv
let g:virtualenv_auto_activate = 1
let g:virtualenv_stl_format = '[%n]'


""" quickrun
nmap <silent> <leader>r :QuickRun<CR>
" runner/vimproc/updatetime で出力バッファの更新間隔をミリ秒で設定可能
" updatetime が一時的に書き換えられてしまうので注意
" let g:quickrun_config = {
" \   "_" : {
" \       "runner" : "vimproc",
" \       "runner/vimproc/updatetime" : 60,
" \   },
" \   'objc': {
" \     'command': 'cc',
" \     'exec': ['%c %s -o %s:p:r -framework Foundation', '%s:p:r %a', 'rm -f %s:p:r'],
" \     'tempfile': '{tempname()}.m',
" \   }
" \}


"" vim-go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_list_type = 'quickfix'
let g:go_fmt_command = 'goimports'
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_list_autoclose = 1
let g:go_decls_mode = 'ctrlp.vim'

augroup GolangSettings
  autocmd!
  autocmd FileType go nmap <leader>gb <Plug>(go-build)
  autocmd FileType go nmap <leader>gd :<C-u>GoDecls<CR>
  autocmd FileType go nmap <leader>gdd :<C-u>GoDeclsDir<CR>
  autocmd FileType go nmap <leader>gcl :<C-u>GoCallers<CR>
  autocmd FileType go nmap <leader>gt <Plug>(go-test)
  autocmd FileType go nmap <Leader>ds <Plug>(go-def-split)
  autocmd FileType go nmap <Leader>dv <Plug>(go-def-vertical)
  autocmd FileType go nmap <Leader>dt <Plug>(go-def-tab)
  autocmd FileType go :highlight goErr cterm=bold ctermfg=214
  autocmd FileType go :match goErr /\<err\>/
augroup END


""" deoplete
let g:deoplete#enable_at_startup = 1


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
\   'python': ['flake8', 'ruff', 'isort', 'mypy'],
\   'typescript': ['eslint'],
\   'go': ['gopls'],
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
