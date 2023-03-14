autoload -U colors compinit promptinit && colors && compinit && promptinit
prompt=%B%F{green}%1~' '%f%b  # 设置默认命令行提示符样式
# setopt autocd # 只是文件名也可以cd
setopt completealiases #启动命令行别名的自动补全
setopt completeinword
unsetopt beep nomatch
# unsetopt PROMPT_SP
zstyle ':completion:*' rehash true  # 刷新自动补全
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
zstyle ':completion:*' menu select  # 启动使用方向键控制的自动补全
ttyctl -f # 许多程序会修改终端的状态并且在异常退出的时候不会还原初始状态。下面的配置可以避免手动重置终端

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS #消除历史记录中的重复条目

bindkey '^[[Z' reverse-menu-complete # shift table 回选

bindkey '^[[A' up-line-or-search  # 查找历史记录 只显示以当前命令开头的历史记录
bindkey '^[[B' down-line-or-search  # 查找历史记录 只显示以当前命令开头的历史记录

# vi mode
bindkey -v

# edit with ctrl-v the input buffer in $EDITOR
autoload -U edit-command-line; 
zle -N edit-command-line; 
bindkey '^v' edit-command-line;
bindkey -M vicmd '^v' edit-command-line
bindkey '^[[P' delete-char
bindkey -M vicmd '^[[P' vi-delete-char
bindkey -M visual '^[[P' vi-delete

# Change cursor shape for different vi modes.
zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
} && zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
} && zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# 修改清屏方式
# 将内容挤出屏幕而不是直接清空
scroll-and-clear-screen() {
    printf '\n%.0s' {1..$LINES}
    zle clear-screen
} && zle -N scroll-and-clear-screen
bindkey '^l' scroll-and-clear-screen

# # ranger 目录同步
# $TERMCMD && $RANGERCD && unset RANGERCD  # && ranger-cd
# ranger-cd() {
#     temp_file="$(mktemp -t "ranger_cd.XXXXXXXXXX")"
#     ranger --choosedir="$temp_file" -- "${@:-$PWD}"
#     if chosen_dir="$(cat -- "$temp_file")" && [ -n "$chosen_dir" ] && [ "$chosen_dir" != "$PWD" ]; then
#         cd -- "$chosen_dir"
#     fi
#     rm -f -- "$temp_file"
# }
# bindkey -s '^o' '^uranger-cd\n'

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp -uq)"
    trap 'rm -f $tmp >/dev/null 2>&1 && trap - HUP INT QUIT TERM PWR EXIT' HUP INT QUIT TERM PWR EXIT
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
} && zle -N lfcd
bindkey '^o' lfcd

# 仿 Fish 命令高亮
# inspired by https://github.com/MrElendig/dotfiles-alice/blob/master/.zshrc
# LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
# export LS_COLORS
if [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  . /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
if [[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  . /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
if [[ -f /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ]]; then
  . /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
fi
# pkgfile "command not found" handler
if [[ -f /usr/share/doc/pkgfile/command-not-found.zsh ]]; then
  . /usr/share/doc/pkgfile/command-not-found.zsh
fi
