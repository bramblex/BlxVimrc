
function! s:Man(word)
    silent exec '!man ' . a:word
    redraw!
endfunction

function! s:ManBySelected()
    let word = utils.GetSelectOnALine()
    call s:Man(word)
endfunction

exec Export('s:Man', 's:ManBySelected')
