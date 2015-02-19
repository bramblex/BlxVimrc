
""""""""""""""""""""""""""""""""""""""""
" VIM外觀配置
function Themes()

    colorscheme molokai
    let g:molokai_original=1
    set t_Co=256

    " 行列的高亮顏色
    hi CursorLine   cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE
    hi CursorColumn cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE

endfunction
call Define('Themes', ['Base', 'Bundle'], function('Themes'))

" End
""""""""""""""""""""""""""""""""""""""""
