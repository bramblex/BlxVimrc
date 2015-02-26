
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

    " 一些辅助函数

    " split()的进阶版本
    "function g:SplitPro(string, separator_list, keep_separator)
        "let l:pieces = [string]
        "for separator in separator_list
            "for i in range(0, l:pieces-1)
                "l:pieces[i] = split()
            "endfor
        "endfor
    "endfunction

    """""""""""""""""""""""""""""""""""""""""
    " String 相关操作

    """""""""""""""""""""""""""""""""""""""""
    " List 相关操作

    " Reduce()扁平化多维数组
    function g:Reduce(m_l)
    endfunction

    " Map()
    function g:Map(li, func)
    endfunction

    " Filter()
    function g:Filter(li, func)
    endfunction


endfunction
call g:Define('Utils', ['Base', 'Bundle'], function('Utils'))

" End
""""""""""""""""""""""""""""""""""""""""
