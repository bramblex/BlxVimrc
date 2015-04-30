function s:Flatten(list)
endfunction

function s:Map(list, Func)
    let result = []
    for item in a:list
        call add(result, a:Func(item))
    endfor
    return result
endfunction

function s:Select(list, Func)
    let result = []
    for item in a:list
        if a:Func(item)
            call add(result, item)
        end
    endfor
    return result
endfunction

function s:Group(list, Func)
    let result = {}
    for item in a:list
        let group = a:Func(item)
        if !has_key(result, group)
            let result[group] = []
        end
        call add(result[group], item)
    endfor
    return result
endfunction

" @TODO How to named it?
function s:Merge(list, Func)
    let result = []
    for item in a:list
        let result = a:Func(result, item)
    endfor
    return result
endfunction

function s:Sort(list, Func)
endfunction

call Exports('Flatten', function('s:Flatten'))
            \('Map', function('s:Map'))
            \('Select', function('s:Select'))
            \('Group', function('s:Group'))
            \('Merge', function('s:Merge'))
