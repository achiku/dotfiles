
colorscheme desert256
syntax on

set title
set ruler

set number
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

set ignorecase
set hlsearch

set nowritebackup
set nobackup
set noswapfile

set t_vb=
set novisualbell

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk

" rstの下線を適切な長さで引く: visual mode で <space># と押下する
nnoremap <silent> <space># yyp<c-v>$r#
nnoremap <silent> <space>= yyp<c-v>$r=
nnoremap <silent> <space>- yyp<c-v>$r-

"" dbext.vim
let g:dbext_default_profile_sample = 'type=SQLITE:SQLITE_bin=/usr/local/bin/sqlite3:dbname=/Users/user/work/application/db/database.db'
let g:dbext_default_history_file = '/Users/user/.vim/bundle/dbext'

