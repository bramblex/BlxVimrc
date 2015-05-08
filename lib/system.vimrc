
let s:self = Self()

function s:Cmd(cmd)
    return system(a:cmd)
endfunction

function s:Shell(cmd)
    exec '!' . a:cmd
endfunction

function s:SilentShell(cmd)
    silent call s:self.Shell(a:cmd)
    redraw!
endfunction

function s:CmdExist(cmd)
    return !empty(system('command -v' . a:mmd))
endfunction

function s:Test(exp)
    return !s:self.Cmd('test ' . a:exp . '; echo $?;')
endfunction

function s:OS()
    for fullname in ["unix", "win16", "win32", "win64", "win32unix", "win95",
                \         "mac", "macunix", "amiga", "os2", "qnx", "beos", "vms"]
        if has(fullname)
            break
        endif
        let fullname='unknown'
    endfor

    if fullname[-3:] is 'nix' || fullname[:2] is 'mac' ||
                \fullname is 'qnx' || fullname is 'vms'
        let name='posix'
    elseif fullname[:2] is 'win'
        let name='nt'
    elseif fullname is 'os2'
        let name='os2'
    else
        let name='other'
    endif

    return {'fullname': fullname, 'name': name}
endfunction

call Exports('Cmd', function('s:Cmd'))
            \('Shell', function('s:Shell'))
            \('SilentShell', function('s:SilentShell'))
            \('CmdExist', function('s:CmdExist'))
            \('Test', function('s:Test'))
            \('OS', function('s:OS'))
