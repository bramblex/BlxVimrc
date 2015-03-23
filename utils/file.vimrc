
exec Info('auth', 'brambles')
exec Info('email', 'qjnight@gmail.com')
exec Info('version', 'v0.1')
exec Info('name', 'File')

let s:utils = Require('utils')
function! s:AbsolutePath(path)
    return fnamemodify(resolve(expand(a:path)), ':p')
endfunction

function! s:Dirname(path)
    return fnamemodify(resolve(expand(a:path)), ':p:h')
endfunction

function! s:CurrentFile()
    return s:AbsolutePath('%')
endfunction

function! s:MakeTempFile()
    return substitute(system('mktemp -u -t BlxVimrc'), '\n', '', '')
endfunction

function! s:ChooseFile(dir_path)
    let tmp_file = s:MakeTempFile()
    let location = s:AbsolutePath(a:dir_path)

    silent exec join(['!ranger', location, '--choosefile=' . tmp_file], ' ')
    redraw!

    let result = 0
    if filereadable(tmp_file)
        silent let result = system('cat '. tmp_file)
    endif
    silent call system('rm -rf ' . tmp_file)
    return result
endfunction

function! s:ChooseAndEdit(dir_path)
    let file = s:ChooseFile(a:dir_path)
    if filereadable(file)
        exec 'edit '. file
    endif
endfunction

function! s:IsDir(path)
    let a_path = s:AbsolutePath(a:path)
    return s:utils.Test('-d', a_path)
endfunction

exec Public(
            \'s:CurrentFile',
            \'s:MakeTempFile',
            \'s:ChooseAndEdit',
            \'s:ChooseFile',
            \'s:AbsolutePath',
            \'s:Dirname',
            \'s:IsDir',
            \)
