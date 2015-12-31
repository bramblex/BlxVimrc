
""""""""""""""""""""""""""""""""""""""""
" VIM外觀配置

"let g:molokai_original = 1
"let g:molokai_original_background = 1
colorscheme molokai
"colorscheme monokai
set t_Co=256

" airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline_mode_map = {
            \ '__' : '-',
            \ 'n'  : 'N',
            \ 'i'  : 'I',
            \ 'R'  : 'R',
            \ 'c'  : 'C',
            \ 'v'  : 'V',
            \ 'V'  : 'V',
            \ '' : 'V',
            \ 's'  : 'S',
            \ 'S'  : 'S',
            \ '' : 'S',
            \ }
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
"set noshowmode
"let g:airline_detect_whitespace=0
"
let g:ctrlp_by_filename = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '/'
"let g:airline#extensions#tabline#right_sep = ' '
"let g:airline#extensions#tabline#right_alt_sep = '|'

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
hi Visual cterm=inverse ctermbg=235 gui=inverse guibg=235
"hi Visual ctermbg=lightgrey guibg=lightgrey

"set background=dark

" End
""""""""""""""""""""""""""""""""""""""""
