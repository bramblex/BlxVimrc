
""""""""""""""""""""""""""""""""""""""""
" VIM 一些工具函數的定義

function Utils()
    " windo 遍歷所有的window
    " bufdo 遍歷所有的buffer
    " tabdo 遍歷所有的tab
    "
    
    " 分屏同步滾動函數
    function g:ToggleScrollBindingAllWindows()
        if !&scb
            windo set scb
        else
            windo set scb!
        endif
    endfunction

    " 開關文件管理器
    function g:ToggleExplore()
        let l:path_tail = expand('%:p:t')
        if l:path_tail != ''
            Explore
        else
            blast
        endif
    endfunction

endfunction
call Define('Utils', ['Base', 'Bundle'], function('Utils'))

" End
""""""""""""""""""""""""""""""""""""""""
