
""""""""""""""""""""""""""""""""""""""""
" VIM 模板引擎

function Template()
    " @TODO 一個模板引擎
    
    " read      插入模板
    " input()    接收輸入
    " confirm()  選擇
    "
    " let @[寄存器] = <string>
    " put @[寄存器]      插入寄存器內容
    " readfile()    讀取文件

    function s:GetInput(info, default)
        let value = input(a:info)
        if value == ''
            return a:default
        else
            return value
        endif
    endfunction
    
    function s:ReadFile(path)
        let file_string = ''
        if filereadable(a:path)
            let file_string = join(readfile(a:path))
        endif
        return file_string
    endfunction

    function s:GetValue(code)
        exec 'let tmp = ' . a:code
        return tmp
    endfunction

    function s:InsertText(text)
        let @t = a:text
        put t
    endfunction

    function s:GetTemplate(template)
        return s:ReadFile( g:blx_template_path . '/' . a:template )
    endfunction
    
    function g:Render(template)
        let template = s:GetTemplate(a:template)
        let pieces = split(l:template, g:blx_template_close_token)

        for i in range(0,len(l:pieces)-1)
            let piece = split(l:pieces, g:blx_template_start_token)
            let stirng = piece[0]
            let code = pieces[1]

            let pieces[i] = string + s:GetValue(code)
        endfor

        s:InsertText(join(pieces))
    endfunction

endfunction
call Define('Template', ['Base', 'Bundle', 'Utils'], function('Template'))

" End
""""""""""""""""""""""""""""""""""""""""
