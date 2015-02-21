
""""""""""""""""""""""""""""""""""""""""
" VIM快捷鍵設置

function Hotkeys()
    " <C-o><C-i> 回退以及追進光標位置

    " Leader鍵
    let mapleader='\'
    let g:mapleader = '\'

    " 基本操作
    nmap <leader>q :q<CR>
    nmap <leader>w :w<CR>

    " 切換buffer
    nmap <C-n> :MBEbn<CR>
    nmap <C-p> :MBEbp<CR>
    nmap <leader>d :MBEbd<CR>
    "nmap <C-n> :bn<CR>
    "nmap <C-p> :bp<CR>
    "nmap <leader>d :bd<CR>

    " NERDTree快捷鍵
    "nmap <leader>e :NERDTreeToggle<CR>

    " 窗口操作
    nmap <leader>v <C-w>v
    nmap <leader>s <C-w>s

    nmap <C-l> <C-w>l
    nmap <C-h> <C-w>h
    nmap <C-j> <C-w>j
    nmap <C-k> <C-w>k

    " 去除搜索後留下的高亮
    nmap <leader>/ :nohl<CR>

    " 粘貼模式
    set pastetoggle=<F5>

    " 寄存器優化

        " 利用寄存器
        nmap <leader>y "ry
        nmap <leader>p "rp

    " 自动注释
    vmap / \c<space>
    nmap // \c<space>

    " 分屏幕同步滾動
    nmap <leader>b :call ToggleScrollBindingAllWindows()<CR>

    " 插入命令的輸出
    " 例如：
    "   1.輸入date則插入時間
    "   2.輸入cal則插入日曆
    "   3.輸入ls則插入當前目錄下的文件列表
    nmap <leader>r :read!

    " 文件管理器快捷鍵
    " %     create a new file
    " d     create a new directory
    " R     rename the file/directory
    " D     Delete the file/directory
    nmap <leader>e :call ToggleExplore()<CR>

endfunction
call Define('Hotkeys', ['Base', 'Bundle', 'Utils', 'Netrw'], function('Hotkeys'))


" End
""""""""""""""""""""""""""""""""""""""""
