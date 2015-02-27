
""""""""""""""""""""""""""""""""""
" Vundle 插件管理器

function Bundle()

    set nocompatible              " be iMproved, required
    filetype off                  " required
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " @TODO 不能動態加載插件簡直無情……如果不行的花電視見自己造一個

    " Vundle插件管理器
        Plugin 'gmarik/Vundle.vim'

    " BlxMolokai
        Plugin 'bramblex/molokai'

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

    " MiniBufexpl.vim
        Bundle 'fholgado/minibufexpl.vim'

    call vundle#end()            " required
    filetype plugin indent on    " required

endfunction
call g:Define('Bundle', [], function('Bundle'))

" End
""""""""""""""""""""""""""""""""""
