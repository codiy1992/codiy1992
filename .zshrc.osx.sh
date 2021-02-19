ROOT_PATH="${HOME}/Repos/setup"
source ${ROOT_PATH}/scripts/.zshrc.sh

# 可执行程序文件路径
export PATH="/usr/local/Cellar/python@3.9/3.9.1_6/Frameworks/Python.framework/Versions/3.9/bin:$PATH"

# 命令别名 - OSX
alias sed='gsed'
alias grep='ggrep'
alias rc='vim ~/.zshrc.osx.sh; source ~/.zshrc.osx.sh'
alias @='_func() { code ~/.workspaces/"$1".code-workspace; }; _func'

# 命令别名 - 工作
alias ops='cd ~/Works/wn-devops && make bash'
alias deploy='ssh -t deploy "cd /devops; make bash"'
alias work='_func() {cd ~/Works/.wlive; if [ -n "$1" ]; then make "$1"; else make; fi; popd}; _func'

# 命令别名 - 机器操作
alias fk.cron='ssh -i ~/.ssh/wlive.pem ec2-user@18.197.217.42'
alias fk.goim='ssh -i ~/.ssh/wlive.pem ec2-user@52.59.193.153'
alias fk.exec='ssh -i ~/.ssh/wlive.pem ec2-user@3.122.150.42'
alias fk.logs='DATE=$(date +%Y-%m-%d);ssh fk.logs -t "cd /data/${DATE}; /bin/bash --login;"'
alias fk.logs.web='ssh fk.logs -N -L 8080:127.0.0.1:80 &'
alias hk.01='ssh hk.01 -t "sudo su; /bin/bash --login;"'
alias hk.03='ssh hk.03 -t "sudo su; /bin/bash --login;"'
alias hk.db='ssh hk.db -t "sudo su; /bin/bash --login;"'
alias fk.logs.api='_func() {
    DATE=$(date +%Y-%m-%d);
    multitail -c -l "ssh fk.logs tail -f /data/${DATE}/api/$1-${DATE}.log"
}; _func'
alias fk.logs.act='_func() {
    DATE=$(date +%Y-%m-%d);
    multitail -c -l "ssh fk.logs tail -f /data/${DATE}/activity/logs/$1-${DATE}.log"
}; _func'
alias fk.logs.nginx='_func() {
    DATE=$(date +%Y-%m-%d);
    multitail -c -l "ssh fk.logs tail -f /data/${DATE}/$1/logs/access.log"
}; _func'


