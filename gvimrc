
if has('gui_macvim')
    syntax on
    set noundofile
    set transparency=10
    set antialias
    set guifont=Monaco:h14
    set columns=120
    set lines=50
    set lines=50
    set textwidth=0
    " ビープ音なし
    set visualbell t_vb=
    set nobackup
    highlight Cursor guifg=NONE guibg=Green
    highlight CursorIM guifg=NONE guibg=Purple
    set noimdisableactivate
    " ヤンクをクリップボードへ送り込む
    set clipboard+=unnamed
endif
