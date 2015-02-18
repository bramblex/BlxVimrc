
""""""""""""""""""""""""""""""""""""""""
" VIM快捷鍵設置

" Leader鍵
let mapleader='\'

" 基本操作
nmap <leader>q :q<CR>
nmap <leader>w :w<CR>

" 切換buffer
" nmap <C-n> :MBEbn<CR>
" nmap <C-p> :MBEbp<CR>
" nmap <leader>d :MBEbd<CR>
nmap <C-n> :bn<CR>
nmap <C-p> :bp<CR>
nmap <leader>d :bd<CR>

" NERDTree快捷鍵
nmap <leader>e :NERDTreeToggle<CR>

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

" End
""""""""""""""""""""""""""""""""""""""""
