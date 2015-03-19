
exec Info('auth', 'brambles')
exec Info('email', 'qjnight@gmail.com')
exec Info('version', 'v0.1')
exec Info('name', 'File')
exec Info('description', 'Some tools for file system operations.')

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

function! s:ChooseFile(path)
    let tmp_file = s:MakeTempFile()
    let location = s:AbsolutePath(a:path)

    silent exec join(['!ranger', location, '--choosefile=' . tmp_file], ' ')
    redraw!
    if filereadable(tmp_file)
        silent return system('cat '. tmp_file)
    endif
    silent call system('rm -rf ' . tmp_file)
endfunction

function! s:ChooseAndOpen(path)
    let file = s:ChooseFile(a:path)
    if filereadable(file)
        exec 'edit '. file
    endif
endfunction

exec Public(
            \'s:CurrentFile',
            \'s:MakeTempFile',
            \'s:ChooseAndOpen',
            \'s:ChooseFile',
            \'s:AbsolutePath',
            \'s:Dirname',
            \)
