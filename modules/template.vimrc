
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
    let s:template_path = g:config['template_path']
    let s:template_start_token = g:config['template_start_token']
    let s:template_close_token = g:config['template_close_token']

    " 帶默認值的input
    function s:GetDInput(info, default)
        let value = input(a:info)
        if value == ''
            return a:default
        else
            return value
        endif
    endfunction

    " 循環，直到接受到非空值
    function s:GetWInput(info)
        let value = ''
        while value == ''
            let value = input(a:info)
        endwhile
        return value
    endfunction

    " @TODO 循環，直到接受到正確的值，用正則判斷
    "function s:GetRInput(info)
    "endfunction
    
    " 讀取文件，並且轉化爲字符串
    function s:ReadFile(path)
        let file_string = ''
        if filereadable(a:path)
            let file_string = join(readfile(a:path), "\n")
        endif
        return file_string
    endfunction

    " 執行內嵌在模板內的代碼並返回結果
    function s:GetValue(code)
        exec 'let tmp = ' . a:code
        return tmp
    endfunction

    " 利用t寄存器插入文字
    function s:InsertText(text)
        let @t = a:text
        put t
    endfunction

    " 補全模板完整路徑
    function s:GetTemplate(template)
        return s:ReadFile( s:template_path . '/' . a:template )
    endfunction
    
    " 渲染模板
    function s:Render(template)
        let template = s:GetTemplate(a:template)

        if template == ''
            echo '未找到模板：' . a:template '，或模板爲空'
            return
        endif

        let pieces = split(l:template, s:template_close_token)

        for i in range(0,len(pieces)-1)
            let piece = split(pieces[i], s:template_start_token)
            let str = piece[0]
            let code = piece[1]

            let pieces[i] = str . s:GetValue(code)
        endfor

        call s:InsertText(join(pieces))
    endfunction

    " 對外接口，優化輸入
    function g:RenderTemplate()
        let t = s:GetWInput('請輸入模板名：')
        call s:Render(t)
    endfunction

endfunction
call g:Define('Template', ['Base', 'Bundle', 'Utils'], function('Template'))

" End
""""""""""""""""""""""""""""""""""""""""
