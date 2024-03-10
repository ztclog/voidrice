autoload -U colors compinit && colors && compinit
prompt=%B%F{green}%1~' '%f%b  # 设置默认命令行提示符样式
compinit

bindkey '^[[P' vi-backward-delete-char # delete
bindkey -M vicmd '^[[P' vi-backward-delete-char
bindkey '^[[Z' reverse-menu-complete # shift+tab

# Options are primarily referred to by name. These names are case insensitive and underscores are ignored. 
# For example, `allexport' is equivalent to `A__lleXP_ort'.
# --------------------------------------------------------------------------------------------------------
setopt	NO_AUTO_CD
setopt	COMPLETE_ALIASES
setopt	COMPLETE_IN_WORD
setopt	INTERACTIVE_COMMENTS
setopt	HIST_FIND_NO_DUPS
setopt	HIST_IGNORE_ALL_DUPS
setopt	HIST_IGNORE_SPACE
setopt	MENU_COMPLETE

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000

# 修改清屏方式 将内容挤出屏幕而不是直接清空
scroll-and-clear-screen() {
    printf '\n%.0s' {1..$LINES}
    zle clear-screen
} && zle -N scroll-and-clear-screen
bindkey '^l' scroll-and-clear-screen

# lf 同步目录 and bind it to ctrl-o
lfcd () {
	tmp="$(mktemp -uq)"
	trap 'rm -f $tmp >/dev/null 2>&1 && trap - HUP INT QUIT TERM PWR EXIT' HUP INT QUIT TERM PWR EXIT
	lf -last-dir-path="$tmp" "$@"
	if [ -f "$tmp" ]; then
		dir="$(cat "$tmp")"
		[ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
	fi
}
bindkey -s '^o' '^ulfcd\n'

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
