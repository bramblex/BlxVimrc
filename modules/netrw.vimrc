
""""""""""""""""""""""""""""""""""""""""
" VIM NetrwExplore文件瀏覽器配置
"
function Netrw()
    " 捨棄了NerdTree，用原生的Netrw Explore
    " @TODO 文件瀏覽器的配置
    
    let g:netrw_liststyle=1

endfunction
call Define('Netrw', ['Base', 'Bundle', 'Utils'], function('Netrw'))

" End
""""""""""""""""""""""""""""""""""""""""
