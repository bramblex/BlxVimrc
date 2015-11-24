" Json := Object
"   | List
"   | String 
"   | Number 
"   | Boolean
"   | Null
"
" Object := '{' KeyValueList '}' 
" KeyValueList := KeyValue | KeyValue ',' KeyValueList | ε
" KeyValue := String ':' Json 
"
" List :=  '[' ListBody ']'
" ListBody := Json | Json ',' ListBody | ε
"
" String := /".*[^\\]?"/
" Number := /\d+|\d+\.\d+/
" Boolean := /true|false/
" Null := /null/

function Module.Define()
    " Interface
    function self.parse(json_string)
        let l:token_stream = s:lex(a:json_string)
        return s:parseJson(l:token_stream, 0)[0]
    endfunction

    function self.load(path)
        if filereadable(a:path) 
            return self.parse(join(readfile(a:path), "\n"))
        else
            throw 'Read File Error'
        endif
    endfunction

    let s:dfa_states = []
    for i in range(0, 26)
        call add(s:dfa_states, {'nu': i})
    endfor

    let s:dfa_states[0][' '] = s:dfa_states[20]
    let s:dfa_states[0]["\t"] = s:dfa_states[20]
    let s:dfa_states[0]["\n"] = s:dfa_states[20]
    let s:dfa_states[0]["\r"] = s:dfa_states[20]
    let s:dfa_states[0]['"'] = s:dfa_states[1]
    let s:dfa_states[0]['0'] = s:dfa_states[4]
    let s:dfa_states[0]['1'] = s:dfa_states[4]
    let s:dfa_states[0]['2'] = s:dfa_states[4]
    let s:dfa_states[0]['3'] = s:dfa_states[4]
    let s:dfa_states[0]['4'] = s:dfa_states[4]
    let s:dfa_states[0]['5'] = s:dfa_states[4]
    let s:dfa_states[0]['6'] = s:dfa_states[4]
    let s:dfa_states[0]['7'] = s:dfa_states[4]
    let s:dfa_states[0]['8'] = s:dfa_states[4]
    let s:dfa_states[0]['9'] = s:dfa_states[4]
    let s:dfa_states[0]['t'] = s:dfa_states[7]
    let s:dfa_states[0]['f'] = s:dfa_states[11]
    let s:dfa_states[0]['n'] = s:dfa_states[16]
    let s:dfa_states[0]['['] = s:dfa_states[21]
    let s:dfa_states[0][']'] = s:dfa_states[22]
    let s:dfa_states[0]['{'] = s:dfa_states[23]
    let s:dfa_states[0]['}'] = s:dfa_states[24]
    let s:dfa_states[0][':'] = s:dfa_states[25]
    let s:dfa_states[0][','] = s:dfa_states[26]

    let s:dfa_states[1]['\'] = s:dfa_states[2]
    let s:dfa_states[1]['"'] = s:dfa_states[3]
    let s:dfa_states[1]['other'] = s:dfa_states[1]

    let s:dfa_states[2]['other'] = s:dfa_states[1]

    let s:dfa_states[3]['accpet'] = 1
    let s:dfa_states[3]['type'] = 'String'

    let s:dfa_states[4]['accpet'] = 1
    let s:dfa_states[4]['type'] = 'Number'
    let s:dfa_states[4]['0'] = s:dfa_states[4]
    let s:dfa_states[4]['1'] = s:dfa_states[4]
    let s:dfa_states[4]['2'] = s:dfa_states[4]
    let s:dfa_states[4]['3'] = s:dfa_states[4]
    let s:dfa_states[4]['4'] = s:dfa_states[4]
    let s:dfa_states[4]['5'] = s:dfa_states[4]
    let s:dfa_states[4]['6'] = s:dfa_states[4]
    let s:dfa_states[4]['7'] = s:dfa_states[4]
    let s:dfa_states[4]['8'] = s:dfa_states[4]
    let s:dfa_states[4]['9'] = s:dfa_states[4]
    let s:dfa_states[4]['.'] = s:dfa_states[5]

    let s:dfa_states[5]['0'] = s:dfa_states[6]
    let s:dfa_states[5]['1'] = s:dfa_states[6]
    let s:dfa_states[5]['2'] = s:dfa_states[6]
    let s:dfa_states[5]['3'] = s:dfa_states[6]
    let s:dfa_states[5]['4'] = s:dfa_states[6]
    let s:dfa_states[5]['5'] = s:dfa_states[6]
    let s:dfa_states[5]['6'] = s:dfa_states[6]
    let s:dfa_states[5]['7'] = s:dfa_states[6]
    let s:dfa_states[5]['8'] = s:dfa_states[6]
    let s:dfa_states[5]['9'] = s:dfa_states[6]

    let s:dfa_states[6]['accpet'] = 1
    let s:dfa_states[6]['type'] = 'Float'
    let s:dfa_states[6]['0'] = s:dfa_states[6]
    let s:dfa_states[6]['1'] = s:dfa_states[6]
    let s:dfa_states[6]['2'] = s:dfa_states[6]
    let s:dfa_states[6]['3'] = s:dfa_states[6]
    let s:dfa_states[6]['4'] = s:dfa_states[6]
    let s:dfa_states[6]['5'] = s:dfa_states[6]
    let s:dfa_states[6]['6'] = s:dfa_states[6]
    let s:dfa_states[6]['7'] = s:dfa_states[6]
    let s:dfa_states[6]['8'] = s:dfa_states[6]
    let s:dfa_states[6]['9'] = s:dfa_states[6]

    let s:dfa_states[7]['r'] = s:dfa_states[8]
    let s:dfa_states[8]['u'] = s:dfa_states[9]
    let s:dfa_states[9]['e'] = s:dfa_states[10]
    let s:dfa_states[10]['accpet'] = 1
    let s:dfa_states[10]['type'] = 'Boolean'

    let s:dfa_states[11]['a'] = s:dfa_states[12]
    let s:dfa_states[12]['l'] = s:dfa_states[13]
    let s:dfa_states[13]['s'] = s:dfa_states[14]
    let s:dfa_states[14]['e'] = s:dfa_states[15]
    let s:dfa_states[15]['accpet'] = 1
    let s:dfa_states[15]['type'] = 'Boolean'

    let s:dfa_states[16]['r'] = s:dfa_states[17]
    let s:dfa_states[17]['u'] = s:dfa_states[18]
    let s:dfa_states[18]['e'] = s:dfa_states[19]
    let s:dfa_states[19]['accpet'] = 1
    let s:dfa_states[19]['type'] = 'Null'

    let s:dfa_states[20][' '] = s:dfa_states[20]
    let s:dfa_states[20]["\t"] = s:dfa_states[20]
    let s:dfa_states[20]["\n"] = s:dfa_states[20]
    let s:dfa_states[20]["\r"] = s:dfa_states[20]
    let s:dfa_states[20]['accpet'] = 1
    let s:dfa_states[20]['type'] = 'Ignore'

    let s:dfa_states[21]['accpet'] = 1
    let s:dfa_states[21]['type'] = '['

    let s:dfa_states[22]['accpet'] = 1
    let s:dfa_states[22]['type'] = ']'

    let s:dfa_states[23]['accpet'] = 1
    let s:dfa_states[23]['type'] = '{'

    let s:dfa_states[24]['accpet'] = 1
    let s:dfa_states[24]['type'] = '}'

    let s:dfa_states[25]['accpet'] = 1
    let s:dfa_states[25]['type'] = ':'

    let s:dfa_states[26]['accpet'] = 1
    let s:dfa_states[26]['type'] = ','

    function s:lex(input)
        let l:index = 0
        let l:length = len(a:input)
        let l:current_state = s:dfa_states[0]

        let l:tmp_input = ''

        let l:result = []
        while l:index < l:length
            let l:char = a:input[l:index]

            try
                try
                    let l:current_state = l:current_state[l:char]
                catch /E716:/
                    let l:current_state = l:current_state['other']
                endtry
                let l:tmp_input = l:tmp_input . l:char
            catch /E716:/
                if has_key(l:current_state, 'accpet')
                    if l:current_state['type'] != 'Ignore'
                        call add(l:result, [l:current_state['type'], l:tmp_input])
                    endif
                    let l:tmp_input = ''
                else
                    throw 'LexicalAnalyze Error At ' . l:index
                endif

                let l:index = l:index - 1
                let l:current_state = s:dfa_states[0]
            endtry

            let l:index = l:index + 1
        endwhile

        if has_key(l:current_state, 'accpet')
            if l:current_state['type'] != 'Ignore'
                call add(l:result, [l:current_state['type'], l:tmp_input])
            endif
            let l:tmp_input = ''
        else
            throw 'LexicalAnalyze Error At ' . l:index
        endif

        return l:result

    endfunction

    function s:parseJson(token_stream, i)
        let l:first = a:token_stream[a:i]
        let l:first_type = l:first[0]
        let l:first_content = l:first[1]
        if l:first_type == '{'
            return s:parseObject(a:token_stream, a:i)
        elseif l:first_type == '['
            return s:parseList(a:token_stream, a:i)
        elseif l:first_type == 'String'
            return [eval(l:first_content), a:i+1]
        elseif l:first_type == 'Boolean'
            if l:first_content == 'true'
                return [1, a:i+1]
            elseif l:first_content == 'false'
                return [0, a:i+1]
            endif
        elseif l:first_type == 'Number'
            return [str2nr(first_content), a:i+1]
        elseif l:first_type == 'Float'
            return [str2float(first_content), a:i+1]
        elseif l:first_type == 'Null'
            return [0, a:i+1]
        else
            throw 'Parser Error'
        endif
    endfunction

    function s:parseObject(token_stream, i)
        let l:result = s:parseKeyValueList(a:token_stream, a:i+1)
        let l:key_value_list = result[0]
        if a:token_stream[l:result[1]][0] != '}'
            throw 'Parser Error'
        endif

        let l:object = {}
        for key_value in l:key_value_list
            let l:object[key_value[0]] = key_value[1]
        endfor
        return [l:object, l:result[1]+1]
    endfunction

    function s:parseKeyValueList(token_stream, i)
        if a:token_stream[a:i][0] == '}'
            return [[], a:i]
        endif
        let l:result = s:parseKeyValue(a:token_stream, a:i)
        if a:token_stream[l:result[1]][0] == ','
            let l:key_value_list_result = s:parseKeyValueList(a:token_stream, l:result[1]+1)
            return [insert(l:key_value_list_result[0], l:result[0]), l:key_value_list_result[1]]
        else
            return [[l:result[0]], l:result[1]]
        endif
    endfunction

    function s:parseKeyValue(token_stream, i)
        let l:first = a:token_stream[a:i]
        let l:second = a:token_stream[a:i+1]
        if l:first[0] != 'String' || l:second[0] != ':'
            throw 'Parser Error'
        endif
        let l:key = s:parseJson(a:token_stream, a:i)[0]
        let l:value = s:parseJson(a:token_stream, a:i+2)
        return [[l:key, l:value[0]], l:value[1]]
    endfunction 

    function s:parseList(token_stream, i)
        let l:result = s:parseListBody(a:token_stream, a:i+1)
        let l:items_list = result[0]
        if a:token_stream[l:result[1]][0] != ']'
            throw 'Parser Error'
        endif

        let l:list = []
        for item in l:items_list
            call insert(l:list, item)
        endfor
        return [l:list, l:result[1]+1]
    endfunction

    function s:parseListBody(token_stream, i)
        if a:token_stream[a:i][0] == ']'
            return [[], a:i]
        endif
        let l:result = s:parseJson(a:token_stream, a:i)
        if a:token_stream[l:result[1]][0] == ','
            let l:items_list_result = s:parseListBody(a:token_stream, l:result[1]+1)
            return [add(l:items_list_result[0], l:result[0]), l:items_list_result[1]]
        else
            return [[l:result[0]], l:result[1]]
        endif
    endfunction

endfunction

" Vim
" vim: set filetype=vim
" Emacs
" -*- mode: vim; -*-
