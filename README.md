#BlxVimrc
1. [简介](#简介)
2. [require.vimrc简介](#require.vimrc简介)
3. [安装](#安装)
4. [使用](#使用)
5. [require.vimrc使用](#require.vimrc使用)
6. [扩展](#扩展)

##简介:
BlxVimrc是本人自用的一套Vim编辑器配置。BlxVimrc建立在一套完善的模块系统require.vimrc之上。相比现在网上动辄上千行挤在一起的vimrc，BlxVimrc良好的模块化机制使得其更容易理解、维护以及扩展。并且，BlxVimrc也能良好的支持NeoVim。

BlxVimrc的目的并不是将Vim配置成一个功能强大的IDE。BlxVimrc的默认功能非常有限，只有基础的编辑增强功能，并且也并不华丽。BlxVimrc的目的更多的是做好一个编辑器，而不是伪装成一个IDE。如果你需要很多IDE才有强大功能，如调试或者重构，那么建议你使用Vim来编辑，用IDE来调试重构，而不是企图把一个编辑器强行该造成IDE。

##require.vimrc简介：
require.vimrc是使用纯粹的VimScript在VimScript语言层面上模拟了一套类似NodeJs中的模块系统。require.vimrc的使用和NodeJs类似，它的模块(Module)定义和Ruby有些相似，他的包(Packge)的结构和Python类似。具体的例子可以看第四节的[扩展](#扩展)，那里将会告诉你如何使用require.vimrc

require.vimrc中的模块是在VimScript运行中动态加载的，所以你可以选择在你想要的时候进行模块的加载。require.vimrc自带缓存，同样的一个包或者模块只会被加载运行一次。在require.vimrc系统中，模块或者包之间的相互依赖也能够良好的处理，不会像Python那样出现不能相互依赖的蛋疼问题。

##安装：
###1.备份或者删除 ~/.vim, ~/.vimrc 等配置文件
```sh
$ mv ~/.vim ~/.vimrc <path to safe>
# or
$ rm ~/.vim ~/.vimrc -rf
```

###2.直接clone到 ~/.vim
```sh
$ git clone https://github.com/bramblex/BlxVimrc.git ~/.vim
```

###2.将 ~/.vim 的 vimrc 软链出来
```sh
$ ln -s ~/.vim/vimrc ~/.vimrc
```

###3.安装vundle插件管理器
```sh
$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

###4.进入vim，安装插件
```VimL
:BundleInstall
```

###5.等待插件安装完毕后重启vim

##使用
使用主要就是快捷键的事情了。在 BlxVimrc/rc/hotkeys/ 目录下会有介绍。看看就能够明白的。

##require.vimrc使用
###1.加载一个模块或者包

```VimL
" 加载当前脚本下的模块或者包
call Require('module') " 不在乎返回
let module = Require('module') " 在乎返回
```

###2.定义一个模块
```VimL
" hello_module.vimrc
function Module.Define()
    self.text = 'Hello World!'
    function self.run()
        echo self.text
    endfunction
endfunction
```

加载执行上面那个模块
```VimL
let hello_module = Require('hello_module')
call hello_module.run() " => Hello World!
```

###3.定义一个包
```VimL
" hello_package/base.vimrc
function Module.Define()
    self.text = 'Hello World!'
    function self.run()
        echo self.text
    endfunction
endfunction
```
加载执行上面那个包
```VimL
let hello_package = Require('hello_package')
call hello_package.run() " => Hello World!
```

##扩展:
扩展才是BlxVimrc的重头戏。

我们看看我们的vimrc文件。这个文件是Vim配置文件的入口，各位Vimer肯定都知道的。我们的BlxVimrc/vimrc中总够只有一下三行代码。
```VimL
let g:require_base_module = resolve(expand('<sfile>:p')) 
exec 'source ' . resolve(fnamemodify(g:require_base_module, ':h'). '/require.vimrc')
call Require('./') "
```

接下来我们来看BlxVimrc的目录结构
```
BlxVimrc
├── README.md
├── base.vimrc
├── init.vim
├── neo
│   └── base.vimrc
├── rc
│   ├── base.vimrc
│   ├── bundle.vimrc
│   ├── head.vimrc
│   ├── hotkeys
│   │   ├── base.vimrc
│   │   ├── conque.vimrc
│   │   ├── ctrlp.vimrc
│   │   ├── dict.vimrc
│   │   └── rails.vimrc
│   ├── tail.vimrc
│   ├── themes.vimrc
│   └── type.vimrc
├── require.vimrc
├── utils
│   ├── base.vimrc
│   ├── dict.vimrc
│   ├── file.vimrc
│   ├── json.vimrc
│   ├── stack.vimrc
│   ├── utils.vimrc
│   └── xml.vimrc
└── vimrc
```

BlxVimrc由vimrc作为入口，然后把当前目录当成一个包进行加载。然后每一个包都会加载各自的模块和包。

neo包里面包含了一些对于NeoVim的配置，rc包里面包含了所有的基本配置。

utils包比较特殊，里面包含了一些我自己实现的vimscript库。
