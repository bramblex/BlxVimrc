
let s:utils = Require('utils')
let s:config = Require('config')

function! s:Dict(word)
    let dict_path = s:config.Get('dict_path')
    let result = system(printf('%s %s', dict_path, a:word))
    " 使用quickfix窗口显示内容
    cexpr result
    caddexpr "\n"
    cwindow
endfunction

function! s:DictSelectedWord()
    let word = s:utils.GetSelectOnALine()
    call s:Dict(word)
endfunction

function! s:SayBySelected()
    let text = s:utils.GetSelectOnALine()
    call s:Say(text)
endfunction

function! s:Say(text)
    call system('say '.a:text.'&')
endfunction

exec Export('s:Dict', 's:DictSelectedWord', 's:Say', 's:SayBySelected')
