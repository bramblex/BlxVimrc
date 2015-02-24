
""""""""""""""""""""""""""""""""""""""""
" VIM基礎設置
function Base()

    " 开启语法高亮
    syntax on
    "检测文件类型
    filetype on
    "针对不同的文件类型采用不同的缩进格式
    filetype indent on
    "允许插件
    filetype plugin on
    "启动自动补全
    filetype plugin indent on

    " 文件修改之后自动载入。
    set autoread

" 突出显示当前，列
    set cursorcolumn
    set cursorline

" 去掉输入错误的提示声音
    set title                " change the terminal's title
    set novisualbell         " don't beep
    set noerrorbells         " don't beep
    set t_vb=
    set tm=500

"显示行号：
    set number
    "显示当前的行号列号：
    set ruler
    ""在状态栏显示正在输入的命令
    set showcmd
    " 左下角显示当前vim模式
    set showmode

" 退出时询问保存
    set confirm

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
    set scrolloff=3

"设置文内智能搜索提示
    " 高亮search命中的文本。
    set hlsearch
    " 打开增量搜索模式,随着键入即时搜索
    set incsearch
    " 搜索时忽略大小写
    set ignorecase
    " 有一个或以上大写字母时仍大小写敏感
    set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise

" tab相关变更
    set tabstop=4     " 设置Tab键的宽度        [等同的空格个数]
    set shiftwidth=4  " 每一次缩进对应的空格数
    set softtabstop=4 " 按退格键时可以一次删掉 4 个空格
    set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
    set expandtab     " 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
    set shiftround    " 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'

endfunction
call g:Define('Base', ['Bundle'], function('Base'))

" End
""""""""""""""""""""""""""""""""""""""""
