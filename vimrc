
colorscheme desert256
syntax on

set number
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

set hlsearch

"" pathgen.vim
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"" dbext.vim
let g:dbext_default_profile_dtgen = 'type=SQLITE:SQLITE_bin=/usr/local/bin/sqlite3:dbname=/Users/achiku/work/dtgen/application/db/database.db'
let g:dbext_default_profile_sqlalc = 'type=SQLITE:SQLITE_bin=/usr/local/bin/sqlite3:dbname=/Users/achiku/work/sqlalchemy/db/sample.db'
let g:dbext_default_history_file =  '/Users/achiku/.vim/bundle/dbext'

