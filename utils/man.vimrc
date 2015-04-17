
let s:utils = Require('utils')
function! s:Man(word)
    silent exec '!man ' . a:word
    redraw!
endfunction

function! s:ManBySelected()
    let word = s:utils.GetSelectOnALine()
    call s:Man(word)
endfunction

call Exports('Man', function('s:Man'))
            \('ManBySelected', function('s:ManBySelected'))
