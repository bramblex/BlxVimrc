""""""""""""""""""""""""""""""""""""""""
" 各種配置
" 
    let g:config = {}

    " 主要配置
    let config['base_path'] = fnamemodify(resolve(expand('<sfile>:p')), ':h')
    let config['modules_path'] = g:config['base_path'] . '/modules'
    let config['type_path'] = g:config['base_path'] . '/type'

    " 模板配置
    let config['template_path'] = g:config['base_path'] . '/template'
    let config['template_start_token'] = '{{'
    let config['template_close_token'] = '}}'

" End
""""""""""""""""""""""""""""""""""""""""
