
function! s:CmdExists(cmd)
    return !system('type aaa > /dev/null 2>&1; echo -n $?')
endfunction

function! s:Test(opt, arg)
    return !system('test %s %s; echo -n $?')
endfunction

function! s:Args(arguments_list, options)
    let models = items(options)
endfunction

function! s:GetSelectOnALine()
    return getline("'<")[getpos("'<")[2]-1: getpos("'>")[2]-1]
endfunction

function! s:SetTabWidth(n)
    let n = a:n
    let template = 
            \"
            \set tabstop=%s\n 
            \set shiftwidth=%s\n
            \set softtabstop=%s\n
            \"
    exec printf(template, n, n, n)
endfunction

function! s:RefreshFileType(filetype)
    let n = a:filetype
    let template = "set filetype=%s\n"
    exec printf(template, n)
endfunction

function! s:Random()
    return system('echo -n ${RANDOM}')
endfunction

call Exports('SetTabWidth', function('s:SetTabWidth'))
    \('GetSelectOnALine', function('s:GetSelectOnALine'))
    \('RefreshFileType', function('s:RefreshFileType'))
    \('Random', function('s:Random'))
    \('CmdExists', function('s:CmdExists'))
    \('Test', function('s:Test'))
