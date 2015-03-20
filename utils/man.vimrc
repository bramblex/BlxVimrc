
exec Info('auth', 'brambles')
exec Info('email', 'qjnight@gmail.com')
exec Info('version', 'v0.1')
exec Info('name', 'Man')

let s:utils = Require('utils')

function! s:Man(word)
    silent exec '!man ' . a:word
    redraw!
endfunction

function! s:ManBySelected()
    let word = s:utils.GetSelectOnALine()
    call s:Man(word)
endfunction

exec Public('s:Man', 's:ManBySelected')
