
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

        let key = substitute(piece_list[1], '^\s*\(.\{-}\)\s*$', '\1', '')
        call add(result_list, text . a:values[key])
    endfor

endfunction

call Exports('Template', function('s:Template'))
