ROOT_PATH="${HOME}/Repos/setup"
source ${ROOT_PATH}/scripts/.zshrc.sh

# alias
alias rc='vim ~/.zshrc.linux.wsl; source ~/.zshrc.linux.wsl'

# apps
alias idea='/home/codiy/Applications/idea/bin/idea.sh'
alias chrome='google-chrome &'

# homebrew
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# 命令别名 /* shell在单引号中加单引号用成对的 '\'' */
export DONT_PROMPT_WSL_INSTALL="yes"
alias vs='_func() { /mnt/c/Users/codiy/scoop/shims/code '\''\\wsl$\Ubuntu\home\codiy\.workspaces\windows.code-workspace'\''; }; _func'
alias @='_func() { /usr/bin/code ~/.workspaces/"$1".code-workspace; }; _func'

# ----- 图形化程序 -----
# for VcXsrv 指定显示设备
export DISPLAY=$(ip route|awk '/^default/{print $3}'):0
# for fcitx 输入法
export QT_IM_MODULE=fcitx
export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export DefaultIMModule=fcitx
FCITX_PROCESS_COUNT=`ps -ef | grep fcitx | grep -v "grep" | wc -l`
if [ ${FCITX_PROCESS_COUNT} -lt 1 ]; then
  fcitx-autostart &>/dev/null
fi

# run commands
cd ~/Repos
