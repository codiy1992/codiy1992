#!/bin/bash
OS_TYPE=$(uname)

function err() { if [ -z "$1" ]; then echo "params required"; exit; fi; echo -e "\033[49;31m$1\033[0m"; exit;}
function ok() { if [ -z "$1" ]; then echo "params required"; exit; fi; echo -e "\033[49;32m$1\033[0m";}
function warn() { if [ -z "$1" ]; then echo "params required"; exit; fi; echo -e "\033[49;33m$1\033[0m";}
function info() { if [ -z "$1" ]; then echo "params required"; exit; fi; echo -e "\033[49;34m$1\033[0m";}

# Step01: --------------- 检查个人私钥
if [ ! -f ${HOME}/.ssh/id_rsa ]; then err '请确保个人私钥放置在 ~/.ssh/id_rsa' ;fi
if [ `ls -al ${HOME}/.ssh/id_rsa | awk '{print $1}'` != "-rw-------" ]; then err '请确保个人私钥权限为 0600' ;fi

# Step02: --------------- 安装基础软体
if [ ${OS_TYPE} == "Darwin" ]; then
    echo 'Mac OS X';
    # 安装 homebrew
    which brew >/dev/null 2>&1
    if [ ! $? -eq 0 ]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
else
    echo 'Linux';
    DISTRO=$(lsb_release -i | cut -f 2-)
    if [ ! "${DISTRO}" == "Ubuntu" ]; then
        err '不适用于除 Ubuntu 外的 Linux 发行版'
    fi
fi
# 安装 zsh
which zsh >/dev/null 2>&1
if [ ! $? -eq 0 ]; then
    sudo apt-get install zsh
    chsh -s $(which zsh)
fi
# 安装 oh-my-zsh
if [ ! -d ${HOME}/.oh-my-zsh ] || [ "`ls -A ${HOME}/.oh-my-zsh`" = "" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Step03: --------------- 克隆自身仓库至本地
mkdir -p ${HOME}/Repos

REPO_PATH="${HOME}/Repos/setup"

# 克隆远程仓库到本地
if [ ! -d ${REPO_PATH} ] || [ "`ls -A ${REPO_PATH}`" = "" ]; then
    git clone https://github.com/codiy1992/setup.git ${REPO_PATH}
else
    cd ${REPO_PATH}; git pull > /dev/null; popd 2> /dev/null;
fi

# 建立软链接
ln -sf ${PWD}/.gitconfig ~/.gitconfig
ln -sf ${PWD}/.gitignore ~/.gitignore
ln -sf ${PWD}/.gvimrc ~/.gvimrc
ln -sf ${PWD}/.vimrc ~/.vimrc
ln -sf ${PWD}/.zshrc.linux.wsl.sh ~/.zshrc.linux.wsl.sh
ln -sf ${PWD}/.zshrc.osx.sh ~/.zshrc.osx.sh

# Step04: --------------- 配置 oh-my-zsh
sed -i 's/^ZSH_THEME="[^"]*"/ZSH_THEME="agnoster"/' ${HOME}/.zshrc
# @TODO: 待完善
exit 0
