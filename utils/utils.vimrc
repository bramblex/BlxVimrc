
exec Info('auth', 'brambles')
exec Info('email', 'qjnight@gmail.com')
exec Info('version', 'v0.1')

function! s:Args(arguments_list, options)
    let models = items(options)
endfunction

function! s:GetSelectOnALine()
    return getline("'<")[getpos("'<")[2]-1: getpos("'>")[2]-1]
endfunction
exec Public('s:GetSelectOnALine')

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
exec Public('s:SetTabWidth')
