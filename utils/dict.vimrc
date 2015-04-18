
let s:utils = Require('utils')

function! s:Dict(word)
    let dict_path = g:config.Get('dict_path')
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

call Exports('Dict',function('s:Dict'))
            \('DictSelectedWord',function('s:DictSelectedWord'))
            \('Say',function('s:Say'))
            \('SayBySelected',function('s:SayBySelected'))
