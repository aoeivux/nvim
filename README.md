# INSTALLATION BEFORE
run installer/linux_mac.sh or installer/windows.ps1

# INSTALLATION
On linux and macOS:

```shell
git clone https://github.com/artart222/CodeArt ~/.config/nvim
chmod +x ~/.config/nvim/installer/linux-mac.sh
exec ~/.config/nvim/installer/linux-mac.sh
```

On Windows:
🐚 open a powershell session as administrator and run this command:

```shell
git clone https://github.com/artart222/CodeArt $HOME\AppData\Local\nvim
powershell.exe -executionpolicy bypass -file $HOME\AppData\Local\installer\windows.ps1
```


```shell
sudo apt-get install ranger caca-utils highlight atool w3m poppler-utils mediainfo
```

```shell
sudo apt install build-essential openjdk-8-jdk python3 python3-pip
```

node\cargo

```shell
curl https://sh.rustup.rs -sSf | sh
```

安装最新版的node和npm

```Ubuntu
sudo apt-get install curl
```

```shell
curl -sL https://deb.nodesource.com/setup_17.x | sudo -E bash -
```

```
sudo apt-get install -y nodejs
```

```shell
npm install -g neovim
```

安装rg、fd支持telescopelive grep,否则会报错

```shell
sudo apt instal ripgrep fd-find
```

- java jdk client exit 1and signal 0 问题解决
  
  - 将jdk升级到11
    

# Coc.nvim配置

- 根据官网下载Coc.nvim
  
- 安装必要的插件，因为是通过json管理插件：
  

```
:CocInstall coc-json coc-tsserver
```

- 查找对应的语言配置language server configration
  

       [Language servers · neoclide/coc.nvim Wiki · GitHub](https://github.com/neoclide/coc.nvim/wiki/Language-servers)

- 通过命令打开配置文件
  
  ```shell
  :CocConfig
  ```
  

- 安装其余可选（插件市场）
  
  ```shell
  ConInstall coc-marketplace
  ```
  
- 通过CocList marketplace打开

## use lua_lsp

preinstall luarocks

```shell
  sudo apt install luarocks
  sudo luarocks install --server=http://luarocks.org/dev lua-lsp
```


## nvim-telescope/telescope-fzf-native.nvim
需要make/cmake支持
```shell
scoop install make cmake
```

### make
 使用gcc编译多个文件或者一个庞大项目的话使用gcc就很麻烦，这时候可以用make命令工具，
 使用make需要先生成一个makefile文件，在这个文件中包含要创建的目标文件或可执行文件、创建目标文件所依赖的文件和需要运行的命令、编译顺序等信息，make通过读入和解释Makefile中内容来执行gcc/g++编译工作。
 使用make的另一个优点就是如果有一个文件修改了，那么它能使该文件和所有受影响的文件进行重新编译，而不受影响的文件就不必重新编译，这样就节省了编译时间。

### cmake







