
function s:Strip(string)
    return substitute(a:string, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction

function s:ParseInt(string)
    return str2nr(a:string)
endfunction

function s:ParseFloat(string)
    return str2float(a:string)
endfunction

function s:Repeat(string, n)
    return repeat(a:string, a:n)
endfunction

" @TODO mutil separators split
function s:Split(string, separators)
    if type(a:separators) == type('')
        let separators = [a:separators]
    else
        let separators = copy(a:separators)
    endif

    for i in range(0, len(separators) - 1)
        let separators[i] = escape(separators[i], '$^*+!|\/?.(){}[]')
    endfor

    let norm_separator = separators[0]

    let tmp_string = copy(a:string)
    for separator in separators
        if separator != ''
            let tmp_string = substitute(tmp_string, separator, norm_separator, 'g')
        endif
    endfor

    return split(tmp_string, norm_separator)
endfunction

function s:Template(tpl, values)
    let pieces = split(a:tpl, '}}', 1)
    let result_list = []

    for piece in pieces
        let piece_list = split(piece, '{{', 1)
        let text = piece_list[0]

        if len(piece_list) < 2
            call add(result_list, text)
            return join(result_list)
        endif

        let key = s:Strip(piece_list[1])
        call add(result_list, text . a:values[key])
    endfor

endfunction

call Exports('Template', function('s:Template'))
            \('Strip', function('s:Strip'))
            \('ParseInt', function('s:ParseInt'))
            \('ParseFloat', function('s:ParseFloat'))
            \('Repeat', function('s:Repeat'))
            \('Split', function('s:Split'))
