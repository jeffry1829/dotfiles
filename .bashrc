# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export PS1="\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[\033[38;5;10m\][\u@\h \[$(tput sgr0)\]\[\033[38;5;220m\]\w\[$(tput sgr0)\]\[\033[38;5;10m\]]\\$ \[$(tput sgr0)\]"

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
#ulimit -Sv 8388608

# added by Anaconda3 5.3.1 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/petjelinux/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/petjelinux/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/petjelinux/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        export PATH="/home/petjelinux/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

conda activate cytnx

export CYTNX_ROOT=/home/petjelinux/Cytnx_lib
export CYTNX_INC=$(python3 -c "exec(\"import sys\nsys.path.append(\'$CYTNX_ROOT\')\nimport cytnx\nprint(cytnx.__cpp_include__)\")")
export CYTNX_LDFLAGS=$(python3 -c "exec(\"import sys\nsys.path.append(\'$CYTNX_ROOT\')\nimport cytnx\nprint(cytnx.__cpp_linkflags__)\")")
export CYTNX_LIB=$(python3 -c "exec(\"import sys\nsys.path.append(\'$CYTNX_ROOT\')\nimport cytnx\nprint(cytnx.__cpp_lib__)\")")/libcytnx.a
export CYTNX_CXXFLAGS=$(python3 -c "exec(\"import sys\nsys.path.append(\'$CYTNX_ROOT\')\nimport cytnx\nprint(cytnx.__cpp_flags__)\")")


export PATH=/home/petjelinux/sys_programs/nvim-linux64/bin:$PATH
export PATH=/home/petjelinux/sys_programs/node-v16.14.2-linux-x64/bin:$PATH
export PATH=/home/petjelinux/sys_programs/executables:$PATH
#export PATH=/home/petjelinux/anaconda3/envs/cytnx/bin:$PATH
#alias gmake='make'

source /home/petjelinux/intel/oneapi/setvars.sh
#source /opt/intel/oneapi/setvars.sh
export DISPLAY=:1

# onely use this if im testing HsuKe's program
#export LD_LIBRARY_PATH=/home/petjelinux/anaconda3/envs/cytnx/lib:/home/petjelinux/Cytnx_lib/lib64
