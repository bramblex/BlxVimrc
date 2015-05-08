
function s:AbsolutePath(path)
    return fnamemodify(expand(a:path), ':p')
endfunction

function s:Dirname(path)
    return fnamemodify(expand(a:path), ':p:h')
endfunction

function s:CurrentFile()
    return s:AbsolutePath('%')
endfunction

function s:PathJoin()
endfunction
