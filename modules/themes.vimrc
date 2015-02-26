
""""""""""""""""""""""""""""""""""""""""
" VIM外觀配置

function Themes()

    colorscheme molokai
    set t_Co=256

    " 命令行（在状态行下）的高度，默认为1，这里是2
    set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P

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
    
    hi MBENormal guifg=darkgrey ctermfg=darkgrey
    hi MBEVisibleNormal cterm=underline guifg=grey ctermfg=grey
    hi MBEVisibleActiveNormal cterm=underline guifg=lightyellow ctermfg=lightyellow

    " 更改molokai蛋疼選中的顏色
    "hi Visual ctermbg=black guibg=black

    set background=dark
endfunction
call g:Define('Themes', ['Base', 'Bundle'], function('Themes'))

" End
""""""""""""""""""""""""""""""""""""""""
