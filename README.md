👏👏 If you are installing the environment required to run neovim on this machine for the first time run installer/linux_mac.sh or installer/windows.ps1.

# 🎶INSTALLATION

💕
On linux and macOS:

```shell
git clone https://github.com/aoeivux/nvim  ~/.config/nvim 
chmod +x ~/.config/nvim/installer/linux-mac.sh
./ ~/.config/nvim/installer/linux-mac.sh
```

🐚 On Windows:

open a powershell session as administrator and run this command:

```shell
git clone https://github.com/aoeivux/nvim $HOME\AppData\Local\nvim
powershell.exe -executionpolicy bypass -file $HOME\AppData\Local\installer\windows.ps1
```

# 🎉USAGE
## ✨neovim install

run commands in neovim with:
```shell
:PackerSync
```

## 👀vscode settings
put the others/vscode/settings and others/vscode/keybindings file into:
```shell
C:\Users\xean\AppData\Roaming\Code\User\
```

## 🎂JetBrains settings
1. put other/jetbrains/keymaps directory into:
```shell
C:\Users\xxx\AppData\Roaming\JetBrains\IntelliJIdeaxxx\
```
2. put others/jetbrains/.ideavimrc into:

```shell
~/.ideavimrc
```




