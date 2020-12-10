---
title: linux 开发环境配置指引(WSL)
date: 2020-11-20 15:15:27
---

## 更换软件包镜像源为国内镜像源

* 更换为阿里云镜像源 > [参考文档](https://developer.aliyun.com/mirror/)

```shell
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install gcc
sudo apt-get install g++
sudo apt-get install powerline
sudo apt-get install autojump
sudo apt-get install zsh
chsh -s $(which zsh)
```

* 建立新的会话
* 导入 id_rsa 密钥对
* 拉取本仓库代码
```
mkdir ~/Repos
git clone git@github.com:codiy1992/setup.git
cd ~/Repos/setup
bash setup.sh
```

* 设置vim

    ```shell
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    // vim 执行下面命令
    :PluginInstall
    ```

* 安装oh-my-zsh

```shell
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

* 设置zsh

    ```shell
    ZSH_THEME="agnoster"
    plugins=(
            git
            autojump
    )
    # User configuration
    source ~/.zshrc.linux.wsl
    ```


* 安装 homebrew

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

* python & node & ansible

```shell
    // 安装 python2.7
    sudo apt-get install python
    ln -s /usr/bin/python2.7 /usr/bin/python
    // 安装 python3
    brew install python
    brew install yarn
    brew install ansible
    brew install frpc
```

* 安装gnupg,gopass(在linux子系统中可不装, 子系统内使用windows的gopass.exe) > [Ubuntu需自行下载amd64包进行安装](https://github.com/gopasspw/gopass/releases)

```shell
apt-get install gnupg git rng-tools
wget [the URL of the latest .deb release]
sudo dpkg -i gopass-<version>-linux-amd64.deb
gopass clone git@github.com:codiy1992/secrets.git
```