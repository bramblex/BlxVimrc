#BlxVimrc
1. [簡介](#簡介)
2. [安装使用](#安装使用)
3. [擴展](#擴展)

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

##擴展:
vimrc 只是一個模塊裝載器，會自動裝載在modules目錄下的所有模塊，並且會自動處理依賴。 所以如果自己有要求想加入什麼的話，自己自己寫一個模塊放在modules目錄下便可以了

###模塊定義的方法：

####1.在modules目錄下新建一個 <my_module>.vimrc 。

####2.聲明一個需要註冊的函數。
```VimL
function MyModule()
    " 随便干点啥
endfunction
```

####3.用之前聲明的函數註冊模塊。
```VimL
Define(模塊名, 依賴的模塊列表, 之前聲明的函數)
call Define('MyModule', ['base', 'bundle'], function('MyModule'))
```
