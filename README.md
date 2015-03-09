#BlxVimrc
1. [简介](#简介)
2. [安装使用](#安装使用)
3. [扩展](#扩展)

##简介:
BlxVimrc是本人使用的VIM编辑器配置，使用Vundle做插件管理器。这套VIM配置并不追求花哨的功能以及绚丽的外观，当然也更不会让你把你的VIM伪装成一个IDE。我们只做好最基本的最适用的编辑功能，为的是更好的来使用VIM的编辑功能。

##安装使用：
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

##扩展:
vimrc 只是一个模块装载器，会自动装载在modules目录下的所有模块，并且会自动处理依赖。 所以如果自己有要求想加入什麼的话，自己自己写一个模块放在modules目录下便可以了

###添加模块寻址路径
当然也可以在任何地方动态添加模块的寻址路径：
```VimL
  call add(Path(), 'path')
```


###模块定义的方法：
模块的定义非常简单，只需要在模块的寻找路径里面加入一个 xxx.vimrc。并且将需要暴露出来的函数接口通过 exec Public()暴露出来就可以了。

```VimL
  "mymodule.vimrc
  function s:TestModule()
    echo 'test'
  endfuntion

  exec Public('s:TestModule')
```

###模块的调用：
可以通过 ```Require module_name`` 或者 ```let module = Require('module_name') ```来调用模块

```VimL
  let mymodule = Require('mymodule')
  call mymodule.TestModule() "=> 输出'test'
```
