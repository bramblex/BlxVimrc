
""""""""""""""""""""""""""""""""""""""""
" VIM NetrwExplore文件瀏覽器配置
"
function Netrw()
    " 捨棄了NerdTree，用原生的Netrw Explore
    " @TODO 文件瀏覽器的配置
    
    let g:netrw_liststyle=1

    " 記錄一下坑爹的東西
    au * :call g:RecordLastLeaveBuffer()
    au * :call g:RecordLastLeaveBuffer()

    let t:last_file_buffer = 1
    function g:RecordLastLeaveBuffer()
        if expand('%:p:t') != ''
            let t:last_file_buffer = bufnr('%')
        end
    endfunction

    " 開關文件管理器
    function g:ToggleExplore()
        " 当前路径不是目录，或者为空（就是没有打开文件进入vim时的状态）
        if expand('%:p:t') != '' || @% == ''
            Explore
        else
            exec 'b' . t:last_file_buffer
        endif
    endfunction
    

endfunction
"call g:Define('Netrw', ['Base', 'Bundle', 'Utils'], function('Netrw'))

" End
""""""""""""""""""""""""""""""""""""""""
