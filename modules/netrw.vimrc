
""""""""""""""""""""""""""""""""""""""""
" VIM NetrwExplore文件瀏覽器配置
"
function Netrw()
    " 捨棄了NerdTree，用原生的Netrw Explore
    " @TODO 文件瀏覽器的配置
    
    let g:netrw_liststyle=1

    " 記錄一下坑爹的東西
    au BufEnter * :call RecordLastLeaveBuffer()
    function g:RecordLastLeaveBuffer()
        if expand('%:p:t') != ''
            let t:last_leave_buffer = bufnr('%')
        end
    endfunction

    " 開關文件管理器
    function g:ToggleExplore()
        if expand('%:p:t') != ''
            Explore
        else
            exec 'b' . t:last_leave_buffer
        endif
    endfunction
    

endfunction
call Define('Netrw', ['Base', 'Bundle', 'Utils'], function('Netrw'))

" End
""""""""""""""""""""""""""""""""""""""""
