#BlxVimrc
1. [簡介](#簡介)
2. [安装使用](#安装使用)

##簡介:
BlxVimrc是本人使用的VIM編輯器配置，使用Vundle做插件管理器。這套VIM配置並不追求花哨的功能以及絢麗的外觀，當然也更不會讓你把你的VIM僞裝成一個IDE。我們只做好最基本的最適用的編輯功能，爲的是更好的來使用VIM的編輯功能。

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

###3.安装vundle插件管理器
```sh
$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

###4.进入vim，安装插件
```vimscript
:BundleInstall
```

###5.等待插件安装完毕后重启vim
