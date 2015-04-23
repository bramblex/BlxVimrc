#BlxVimrc
1. [简介](#简介)
2. [安装使用](#安装使用)
3. [扩展](#扩展)

##简介:
BlxVimrc是本人使用的VIM编辑器配置。Vimrc建立在一套完善的模块系统require.vimrc上，比起网络上大多数VIM配置文件说更易于理解、管理以及扩展。目前我还没找到像我这样把VIM配置文件都写成工程的奇葩。注：为了代码的好看，决定只支持vim7.4+版本

###require.vimrc 简介：
require.vimrc 是用纯粹的Vimscript在Vimscript中模拟了一套类似nodejs中的模块系统，支持模块(Module)和包(Packge)的概念，支持递归依赖，支持循环依赖(循环依赖会给出Warning，可以添加silent前缀忽略掉。毕竟循环依赖是不健康的……)等特性。动态加载，你可以选择你需要的时候加载。拥有模块缓存，同一个模块在VIM中只会被加载一次。


##安装使用：
###安装:
####1.备份或者删除 ~/.vim, ~/.vimrc 等配置文件
```sh
$ mv ~/.vim ~/.vimrc <path to safe>
# or
$ rm ~/.vim ~/.vimrc -rf
```

####2.直接clone到 ~/.vim
```sh
$ git clone https://github.com/bramblex/BlxVimrc.git ~/.vim
```

####2.将 ~/.vim 的 vimrc 软链出来
```sh
$ ln -s ~/.vim/vimrc ~/.vimrc
```

####3.安装vundle插件管理器
```sh
$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

####4.进入vim，安装插件
```VimL
:BundleInstall
```

####5.等待插件安装完毕后重启vim

###使用
使用主要就是快捷键的事情了。在 BlxVimrc/modules/hotkeys/ 目录下会有介绍。看看就能够明白的。

##扩展:

###添加模块寻址路径
当然也可以在任何地方动态添加模块的寻址路径，在模块中require的话，优先级最高的是模块当前的路径：
```VimL
    " 绝对路基
    call PathAppend('/path/to/modules')

    " '~'开头的路径 
    call PathAppend('~/path/to/modules')

    " 当前模块下的相对路径 
    call PathAppend('./path/to/modules')
    call PathAppend('../path/to/modules')
    call PathAppend('path/to/modules')

    " 语法糖
    call PathAppend('path1')
                \('path2')
                \('path3')
                \('path4')
```


###模块(Module)的定义：
定义个模块和nodejs中定义模块类似
```VimL
    "hello_module.vimrc

    "定义变量
    let s:hello = 'hello world!'

    "定义方法
    function s:SayHello()
        echo s:hello
    endfuntion

    "所要暴露的接口
    call Exports('hello', s:var)
    call Exports('SayHello', function('s:SayHello'))

    "你也可以这样写：
    call Exports
        \('hello', s:var)
        \('SayHello', function('s:SayHello'))
    "语法糖，魔术原理是Exports函数的返回还是Exports函数
```

###模块(Module)的调用：
可以通过 `Require module_name` 或者 `let module = Require('module_name')`来调用模块

```VimL
    let hello_module = Require('hello_module')
    echo hello_module.hello "=> 输出‘hello world!'
    call hello_module.SayHello() "=> 输出'hello world!'
```

###包(Packge)的定义：
定义个模块和python中类似，一个Packge里面要有一个base.vimrc。base.vimrc作为向外暴露的接口。

```
    - hello_package
    |- base.vimrc
    |- hello_module.vimrc
    
```

hello_module.vimrc 和之前一样不变。

```VimL
    "hello_package/base.vimrc
    call Exports('hello_module', Require('hello_module'))
```

###包(Packge)的调用：

```VimL
    let hello_package = Require('hello_package')

    echo hello_package.hello_module.hello "=>输出 'hello world!'
    call hello_package.hello_module.SayHello() "=>输出 'hello world!'
```


