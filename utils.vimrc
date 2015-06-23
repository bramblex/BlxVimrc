function Module.Define()

    function self.CmdExists(cmd)
        return !system('type aaa > /dev/null 2>&1; echo -n $?')
    endfunction

    function self.Test(opt, arg)
        return !system('test %s %s; echo -n $?')
    endfunction

    function self.Args(arguments_list, options)
        let models = items(options)
    endfunction

    function self.GetSelectOnALine()
        return getline("'<")[getpos("'<")[2]-1: getpos("'>")[2]-1]
    endfunction

    function self.SetTabWidth(n)
        let n = a:n
        let template = 
                    \"
                    \set tabstop=%s\n 
                    \set shiftwidth=%s\n
                    \set softtabstop=%s\n
                    \"
        exec printf(template, n, n, n)
    endfunction

    function self.RefreshFileType(filetype)
        let n = a:filetype
        let template = "set filetype=%s\n"
        exec printf(template, n)
    endfunction

    function self.Random()
        return system('echo -n ${RANDOM}')
    endfunction

endfunction
