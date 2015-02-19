
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
    
    hi MBEChanged guifg=darkgrey ctermfg=darkgrey
    hi MBENormal guifg=darkgrey ctermfg=darkgrey
    hi link MBEVisibleNormal MBENormal

    hi MBEVisibleActiveNormal cterm=underline guifg=darkgreen ctermfg=darkgreen
    hi MBEChanged guifg=brown ctermfg=brown
    hi link MBEVisibleChanged MBEChanged
    hi MBEVisibleActiveChanged cterm=underline guifg=darkred ctermfg=darkred


endfunction
call Define('Themes', ['Base', 'Bundle'], function('Themes'))

" End
""""""""""""""""""""""""""""""""""""""""
