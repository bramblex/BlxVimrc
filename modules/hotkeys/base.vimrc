
""""""""""""""""""""""""""""""""""""""""
" VIM快捷鍵設置

" <C-o><C-i> 回退以及追進光標位置

" Leader鍵
let mapleader='\'
let g:mapleader = '\'

" 基本操作
nnoremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>

" 切換buffer
nnoremap <C-n> :MBEbn<cr>
nnoremap <C-p> :MBEbp<cr>
nnoremap <leader>d :MBEbd<cr>
"nnoremap <leader>d :MBEbw<cr>
"nnoremap <C-n> :bn<CR>
"nnoremap <C-p> :bp<CR>
"nnoremap <leader>d :bd<CR>

" NERDTree快捷鍵
"nnoremap <leader>e :NERDTreeToggle<CR>

" 窗口操作
nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s

nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" 去除搜索後留下的高亮
nnoremap <leader>/ :nohl<cr>

" 粘貼模式
set pastetoggle=<F5>

" 寄存器優化

    " 利用寄存器
    nnoremap <leader>y "ry
    nnoremap <leader>p "rP

" 自动注释
vmap / \c<space>
nmap // \c<space>
imap <C-\>/ <esc>\c<space>$a

" 分屏幕同步滾動
"let utils = Require('utils')
"nnoremap <leader>b :call utils.ToggleScrollBinding()<cr>

" 插入命令的輸出
" 例如：
"   1.輸入date則插入時間
"   2.輸入cal則插入日曆
"   3.輸入ls則插入當前目錄下的文件列表
nnoremap <leader>r :silent read!

" 文件管理器快捷鍵
" %     create a new file
" d     create a new directory
" R     rename the file/directory
" D     Delete the file/directory
" nnoremap <leader>e :call g:ToggleExplore()<cr>
"nnoremap <leader>e :NERDTreeToggle<cr>
"let file = Require('file')
nnoremap <leader>% :call utils.file.ChooseAndOpen('')<cr>
nnoremap <leader>e :call utils.file.ChooseAndEdit(utils.file.Dirname('%'))<cr>

" Git相關
nnoremap <leader>g :!git 
nnoremap <leader>gc :!git add -A && git commit -a<cr>
nnoremap <leader>gp :!git push<cr>
nnoremap <leader>gs :!git status<cr>

" 輸出模板
"nnoremap <Leader>t :call g:RenderTemplate()<cr>

"   选择替换搜索
nnoremap <leader>S :%s///g<left><left><left>
vnoremap <leader>S :s///g<left><left><left>

Require rails
Require dict
Require ctrlp
Require man
Require insert 
Require conque

" End
""""""""""""""""""""""""""""""""""""""""
