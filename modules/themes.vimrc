
""""""""""""""""""""""""""""""""""""""""
" VIM外觀配置

function Themes()

    colorscheme molokai
    let g:molokai_original=1
    set t_Co=256

    " 行列的高亮顏色
    hi CursorLine   cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE
    hi CursorColumn cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE

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

endfunction
call Define('Themes', ['Base', 'Bundle'], function('Themes'))

" End
""""""""""""""""""""""""""""""""""""""""
