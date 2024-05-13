autoload -U colors compinit && colors && compinit
prompt=%B%F{green}%1~' '%f%b  # 设置默认命令行提示符样式

bindkey '^[[P' delete-char # delete
bindkey -M vicmd '^[[P' delete-char
bindkey '^?' backward-delete-char
bindkey '^[[Z' reverse-menu-complete # shift+tab

bindkey	'^[[A' history-substring-search-up
bindkey	'^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Options are primarily referred to by name. These names are case insensitive and underscores are ignored. 
# For example, `allexport' is equivalent to `A__lleXP_ort'.
# --------------------------------------------------------------------------------------------------------
setopt	NO_AUTO_CD
setopt	MENU_COMPLETE
setopt	COMPLETE_ALIASES
setopt	COMPLETE_IN_WORD
setopt	HIST_SAVE_NO_DUPS
setopt	HIST_IGNORE_SPACE
setopt	HIST_IGNORE_ALL_DUPS
setopt	INTERACTIVE_COMMENTS

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000

# 修改清屏方式 将内容挤出屏幕而不是直接清空
scroll-and-clear-screen() {
    printf '\n%.0s' {1..$LINES}
    zle clear-screen
} && zle -N scroll-and-clear-screen
bindkey '^l' scroll-and-clear-screen

eval "$(sheldon source)"	# sheldon plugin manager
[ -f /usr/share/doc/pkgfile/command-not-found.zsh ] && source /usr/share/doc/pkgfile/command-not-found.zsh
