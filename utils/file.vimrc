
function! s:AbsolutePath(path)
    return fnamemodify(expand(a:path), ':p')
endfunction

function! s:Dirname(path)
    return fnamemodify(expand(a:path), ':p:h')
endfunction

function! s:CurrentFile()
    return s:AbsolutePath('%')
endfunction

function! s:ChooseFile(dir_path)
    let tmp_file = tempname()
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

call Exports
            \('CurrentFile',function('s:CurrentFile'))
            \('ChooseAndEdit', function('s:ChooseAndEdit'))
            \('ChooseFile', function('s:ChooseFile'))
            \('AbsolutePath', function('s:AbsolutePath'))
            \('Dirname', function('s:Dirname'))
