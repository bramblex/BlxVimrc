function Module.Define()

    let self.ranger = 'ranger'

    function self.AbsolutePath(path)
        return fnamemodify(expand(a:path), ':p')
    endfunction

    function self.Dirname(path)
        return fnamemodify(expand(a:path), ':p:h')
    endfunction

    function self.CurrentFile()
        return self.AbsolutePath('%')
    endfunction

    if has('nvim')
        function self.ChooseAndEdit(dir_path)
            let tmp_file = tempname()
            let path = self.AbsolutePath(a:dir_path)

            let rangerCallback = {
                        \'name': 'ranger', 
                        \'tmp_file': tmp_file }
            function! rangerCallback.on_exit(id, code)
                bdelete!
                if filereadable(self.tmp_file)
                    exec 'edit '. system('cat '. self.tmp_file)
                    silent call system('rm -rf ' . self.tmp_file)
                elseif !empty(expand('%'))
                    exec 'edit ' . expand('%')
                endif
            endfunction

            enew
            call termopen( join([self.ranger, path, '--choosefile=' . tmp_file], ' '), rangerCallback)
            startinsert
        endfunction
    else
        function self.ChooseFile(dir_path)
            let tmp_file = tempname()
            let path = self.AbsolutePath(a:dir_path)

            silent exec join(['!', self.ranger, path, '--choosefile=' . tmp_file], ' ')
            redraw!

            let result = 0
            if filereadable(tmp_file)
                silent let result = system('cat '. tmp_file)
            endif
            silent call system('rm -rf ' . tmp_file)
            return result
        endfunction

        function self.ChooseAndEdit(dir_path)
            let file = self.ChooseFile(a:dir_path)
            if filereadable(file)
                exec 'edit '. file
            endif
        endfunction
    end

endfunction
