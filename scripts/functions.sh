# zsh config
prompt_context() {
    if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
        prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
    fi
}

# 输出颜色
function err() { if [ -z "$1" ]; then echo "params can't be null"; exit; fi; echo -e "\033[49;31m$1\033[0m"; exit;}
function ok() { if [ -z "$1" ]; then echo "params can't be null"; exit; fi; echo -e "\033[49;32m$1\033[0m";}
function warn() { if [ -z "$1" ]; then echo "params can't be null"; exit; fi; echo -e "\033[49;33m$1\033[0m";}
function info() { if [ -z "$1" ]; then echo "params can't be null"; exit; fi; echo -e "\033[49;34m$1\033[0m";exit;}

# 待办仓库的初始化及更新
_func_todos() {
    REPO_PATH_TODO="${HOME}/Repos/todos"
    if [ ! -d ${REPO_PATH_TODO} ] || [ "`ls -A ${REPO_PATH_TODO}`" = "" ]; then
        git clone git@github.com:codiy1992/todos.git ${REPO_PATH_TODO}
    else
        cd ${REPO_PATH_TODO}; git pull > /dev/null; popd 2> /dev/null;
    fi
}
