
""""""""""""""""""""""""""""""""""
" Vundle 插件管理器

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle插件管理器
    Plugin 'gmarik/Vundle.vim'

" molokai配色
    Plugin 'tomasr/molokai'

" NERDTree好用的文件管理器
    Plugin 'scrooloose/nerdtree.git'
    let g:NERDTreeWinSize=38

" SuperTab 把补全键换成Tab
    Bundle "ervandew/supertab"
    let g:SuperTabDefaultCompletionType = '<C-n>'

" 自动补全单引号，双引号等
    Bundle 'Raimondi/delimitMate'
    " for python docstring ",优化输入
    au FileType python let b:delimitMate_nesting_quotes = ['"']

" 自动补全html/xml标签
    Bundle 'docunext/closetag.vim'
    let g:closetag_html_style=1

" 快速注释
    Bundle 'scrooloose/nerdcommenter'

" 新的airline配置
    Bundle 'bling/vim-airline'
    " 状态栏设置
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_powerline_fonts=1
    let g:airline_symbols.linenr = '¶'
    set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
    set laststatus=2 "状态栏高度
    " Smarter tab line
    let g:airline#extensions#tabline#enabled = 1

call vundle#end()            " required
filetype plugin indent on    " required

" End
""""""""""""""""""""""""""""""""""
