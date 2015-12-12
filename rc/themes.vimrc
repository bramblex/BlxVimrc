
""""""""""""""""""""""""""""""""""""""""
" VIM外觀配置

"let g:molokai_original = 1
"let g:molokai_original_background = 1
colorscheme molokai
"colorscheme monokai
set t_Co=256

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1

let g:ctrlp_by_filename = 1


" 命令行（在状态行下）的高度，默认为1，这里是2
"set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P

" 行列的高亮顏色
"hi CursorLine   cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE
"hi CursorColumn cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE

" minibufexpl 的颜色设置
" MBENormal
" MBEChanged
" MBEVisibleNormal
" MBEVisibleChanged
" MBEVisibleActiveNormal
" MBEVisibleActiveChanged

"let g:miniBufExplForceSyntaxEnable=1
"let g:miniBufExplSplitBelow = 0
"let g:miniBufExplForceSyntaxEnable = 0
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMaxSize = 0
"let g:miniBufExplModSelTarget = 1
"let g:miniBufExplTabWrap = 1
"let g:miniBufExplUseSingleClick = 1
"let g:miniBufExplCheckDupeBufs = 0
"hi MBENormal guifg=darkgrey ctermfg=darkgrey
"hi MBEVisibleNormal cterm=underline guifg=grey ctermfg=grey
"hi MBEVisibleActiveNormal cterm=underline guifg=lightyellow ctermfg=lightyellow

" 更改molokai蛋疼選中的顏色
"hi Visual ctermbg=lightgrey guibg=lightgrey

"set background=dark

" End
""""""""""""""""""""""""""""""""""""""""
