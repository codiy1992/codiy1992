---
title: 我的Mac装机步骤
date: 2020-03-09 14:07:18
---

## 1. 安装基础软件

- 安装[homebrew](https://brew.sh/)
- 安装输入法
- 设置键盘映射 `System Preferences > Keyboard > Modifier Keys... `

## 2. 安装0h-my-zsh

- 2.1 安装oh-my-zsh

    ```shell
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```

- 2.2 安装powerline字体

    ```shell
    # clone
    git clone https://github.com/powerline/fonts.git --depth=1
    # install
    cd fonts
    ./install.sh
    # clean-up a bit
    cd ..
    rm -rf fonts
    ```

- 2.3 设置item2配色方案和字体

    > Perferences—->Profiles—->Colors—->Color Presets 选择 Solarized Dark
    >
    > Perferences—->Profiles—->Text-->Font 选择任意 Powerline 结尾的字体

- 2.4 安装zsh插件

    > brew install autojump
    >
    > 在.zshrc中指定插件 plugins=(git autojump)

- 2.5 修改zsh主题

    ```shell
    vi .zshrc
    // 修改ZSH_THEME
    ZSH_THEME="agnoster"
    ```

- 2.6 设置.zshrc 不显示电脑名(在.zshrc导出该函数即可)

    ```shell
    prompt_context() {
        if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
        prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
        fi
    }
    ```

## 3. 文件拷贝,配置ssh及vim

```shell
# 从原Mac拷贝以下文件到新Mac
~/.ssh/id_rsa
~/.ssh/id_rsa.pub
~/.ssh/config
~/.ssh/各类ssh的rsa密钥

# 安装macvim
brew cask install macvim
# 从原Mac拷贝以下文件到新Mac
~/.vim/
~/.vimrc
~/.gvimrc

# 工作代码
~/Works

# 自己代码
~/Repos

# 其他有用的文件
~/.aws/
~/.gvimrc
~/.ssh/
~/.vim/
~/.vimrc
~/.zshrc
~/.zshrc.my
~/.workspaces
~/Works
~/Repos
```

## 4. 安装各类软件

```shell
# 必备
brew cask install item2
brew cask install alfred

# 浏览器
brew cask install google-chrome
brew cask install firefox
brew cask install vivaldi

# 编辑器 or IDE
brew cask install intellij-idea

# 数据库工具
brew cask install sequel-pro
brew cask install robo-3t

# Nodejs
brew install node
brew install yarn

# Java
brew tap AdoptOpenJDK/openjdk
brew cask install adoptopenjdk8
brew install maven
brew install gradle

# DevOps
brew install aws-cdk
brew cask install docker

# Others
brew cask install kindle
brew install svn
brew cask install shadowsocksx-ng
brew cask install postman

# 内网穿透工具
brew cask install ngrok

```

## 5. vscode的设定

```txt
1. command + shift + p 输入 settings打开settings.json 拷贝出来
2. command + p 输入 keybindings.json 拷贝出来
```

## 6. 开启mac支持windows的ntfs格式移动硬盘

```shell
sudo nano /etc/fstab
LABEL=移动硬盘名称 none ntfs rw,auto,nobrowse
然后ctrl + o，回车，ctrl + x 回车，保存并退出
```
