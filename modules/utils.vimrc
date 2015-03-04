
""""""""""""""""""""""""""""""""""""""""
" VIM 一些工具函數的定義

function Utils()
    " windo 遍歷所有的window
    " bufdo 遍歷所有的buffer
    " tabdo 遍歷所有的tab
    
    " 分屏同步滾動函數
    function g:ToggleScrollBinding()
        let current_window = winnr()
        if !&scb
            windo set scb
        else
            windo set scb!
        endif
    endfunction

    " 一些辅助函数

    " split()的进阶版本
    function g:SplitPro(string, separator_list)

        let string = deepcopy(a:string)

    endfunction

    """""""""""""""""""""""""""""""""""""""""
    " String 相关操作

    """""""""""""""""""""""""""""""""""""""""
    " List 相关操作

    " Reduce()平坦化多维数组
    "function g:Reduce(m_l)
        "let l  = deepcopy(a:m_l)

        "for i in range(0, len(m_1)-1)
            "if type(l[i]) ==  type([])
                "let s_l = g:Reduce(remove(l, i))

                "for j in reverse(range(0, len(l)-1))
                    "insert(l, s_l[j], i)
                "endfor

            "endif
        "endfor
        "return l
    "endfunction

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
