
let s:utils = Require('utils')
let s:config = Require('config')

function! s:Dict(word)
    let dict_path = s:config.Get('dict_path')
    let reslut = system(printf('%s %s', dict_path, a:word))
    cexpr reslut
    caddexpr "\n"
    cwindow
endfunction
exec Public('s:Dict')

function! s:DictSelectedWord()
    let word = s:utils.GetSelectOnALine()
    call s:Dict(word)
endfunction
exec Public('s:DictSelectedWord')
