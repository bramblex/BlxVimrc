
""""""""""""""""""""""""""""""""""""""""
" VIM 一些工具函數的定義

function Utils()
    " windo 遍歷所有的window
    " bufdo 遍歷所有的buffer
    " tabdo 遍歷所有的tab
    
    " 分屏同步滾動函數
    function g:ToggleScrollBinding()
        if !&scb
            windo set scb
        else
            windo set scb!
        endif
    endfunction

endfunction
call g:Define('Utils', ['Base', 'Bundle'], function('Utils'))

" End
""""""""""""""""""""""""""""""""""""""""
