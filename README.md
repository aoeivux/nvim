# NVIM IDE

可配置 `Java`, `C/C++`, `JavaScript` 等编程语言开发环境。 极速启动 (`startuptime` 20 ~ 70 ms)。

使用 `neovim v0.9.0`+ 版本。

## 安装

### Linux, Mac

```sh
cd ~/.config
git clone  https://github.com/aoeivux/nvim.git
```

### Windows

```sh
cd $env:LOCALAPPDATA
git clone  https://github.com/aoeivux/nvim.git
```

## 依赖

- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fd](https://github.com/sharkdp/fd)
- [JDK17+](https://openjdk.org/)
- [maven](https://maven.apache.org/)
- [nodejs](https://nodejs.org/en)
- [yarn](https://yarnpkg.com/)
- [fzf](https://github.com/junegunn/fzf)

如果你是一个全新的Windows操作系统用户，请在终端运行`nvim`之前确保安装相关依赖，可运行以下命令安装：
```shell
scoop install nodejs python make fzf ripgrep fd gcc 
```

其他依赖可选安装,使用 [mason.nvim](https://github.com/williamboman/mason.nvim)

> 此配置在 Linux, Mac, Windows (推荐使用 [scoop](https://scoop.sh/) 安装依赖) 系统上长期使用

## 快捷键

|              功能               |         模式         |           按键            |
| :-----------------------------: | :------------------: | :-----------------------: |
|            文件管理             |       `Normal`       |        `<leader>e` or `<A-1>`        |
|            文件搜索             |       `Normal`       |       `<leader>ff`        |
|            全局搜索             | `Normal` or `Visual` |       `<leader>fg`        |
|          搜索 symbols           | `Normal` or `Visual` |       `<leader>fs`        |
|             Outline             |       `Normal`       |        `<leader>o`        |
|            查看实现             |       `Normal`       |           `gi`            |
|            查看引用             |       `Normal`       |           `gr`            |
|            查看声明             |       `Normal`       |           `gd`            |
|      格式化(LSP 提供支持)       | `Normal` or `Visual` |        `<leader>fm`        |
|             重命名              |       `Normal`       |       `<leader>rn`        |
|           Code Action           |       `Normal`       |       `<leader>ca`        |
|              Debug              |       `Normal`       |  `F5` or `:DapContinue`   |
|              断点               |       `Normal`       |       `<leader>db`        |
|            内置终端             |      `Command`       |       `:ToggleTerm`       |
|            代码折叠             |       `Normal`       |           `zc`            |
|            代码展开             |       `Normal`       |           `zo`            |

更多配置参考 [keybindings](./lua/aoeivux/core/keybindings.lua) 文件


## 我的 VIM 插件列表

| 插件名称                                                              | 插件描述               | 推荐等级 | 备注 |
| --------------------------------------------------------------------- | ---------------------- | -------- | ---- |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)                       | LSP 代码提示插件       | 10       |      |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)    | 模糊查找插件，窗口预览 | 10       |      |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)          | 状态栏插件             | 8        |      |
| [vim-table-mode](https://github.com/dhruvasagar/vim-table-mode)       | table 模式插件         | 8        |      |


## Neovim 插件列表

- Neovim 精选插件[yutkat/my-neovim-pluginlist](https://github.com/yutkat/my-neovim-pluginlist)
- Neovim 精选插件[rockerBOO/awesome-neovim](https://github.com/rockerBOO/awesome-neovim)
- Neovim 精选插件[neovimcraft](http://neovimcraft.com/)
- 推荐[NvChad](https://github.com/NvChad/NvChad), 部分插件和配置参考了 `NvChad`

## 感谢使用

打造一个高效简单美观的终端环境。欢迎提供各种建议，插件推荐，快捷键定义，主题配色等。
