typeset -g VI_MODE_RESET_PROMPT_ON_MODE_CHANGE
typeset -g VI_MODE_SET_CURSOR
typeset -g VI_MODE_CURSOR_NORMAL=2
typeset -g VI_MODE_CURSOR_VISUAL=6
typeset -g VI_MODE_CURSOR_INSERT=6
typeset -g VI_MODE_CURSOR_OPPEND=0
typeset -g VI_KEYMAP=main

function _vi-mode-set-cursor-shape-for-keymap() {
  local _shape=0
  case "${1:-${VI_KEYMAP:-main}}" in
    main)    _shape=$VI_MODE_CURSOR_INSERT ;; # vi insert: line
    viins)   _shape=$VI_MODE_CURSOR_INSERT ;; # vi insert: line
    isearch) _shape=$VI_MODE_CURSOR_INSERT ;; # inc search: line
    command) _shape=$VI_MODE_CURSOR_INSERT ;; # read a command name
    vicmd)   _shape=$VI_MODE_CURSOR_NORMAL ;; # vi cmd: block
    visual)  _shape=$VI_MODE_CURSOR_VISUAL ;; # vi visual mode: block
    viopp)   _shape=$VI_MODE_CURSOR_OPPEND ;; # vi operation pending: blinking block
    *)       _shape=0 ;;
  esac
  printf $'\e[%d q' "${_shape}"
}

function _visual-mode {
  typeset -g VI_KEYMAP=visual
  _vi-mode-set-cursor-shape-for-keymap "$VI_KEYMAP"
  zle .visual-mode
}
zle -N visual-mode _visual-mode

function _vi-mode-should-reset-prompt() {
  if [[ -z "${VI_MODE_RESET_PROMPT_ON_MODE_CHANGE:-}" ]]; then
    [[ "${PS1} ${RPS1}" = *'$(vi_mode_prompt_info)'* ]]
    return $?
  fi
  [[ "${VI_MODE_RESET_PROMPT_ON_MODE_CHANGE}" = true ]]
}

# Updates editor information when the keymap changes.
function zle-keymap-select() {
  typeset -g VI_KEYMAP=$KEYMAP
  if _vi-mode-should-reset-prompt; then
    zle reset-prompt
    zle -R
  fi
  _vi-mode-set-cursor-shape-for-keymap "${VI_KEYMAP}"
}
zle -N zle-keymap-select

function zle-line-init() {
  local prev_vi_keymap="${VI_KEYMAP:-}"
  typeset -g VI_KEYMAP=main
  [[ "$prev_vi_keymap" != 'main' ]] && _vi-mode-should-reset-prompt && zle reset-prompt
  (( ! ${+terminfo[smkx]} )) || echoti smkx
  _vi-mode-set-cursor-shape-for-keymap "${VI_KEYMAP}"
}
zle -N zle-line-init

function zle-line-finish() {
  typeset -g VI_KEYMAP=main
  (( ! ${+terminfo[rmkx]} )) || echoti rmkx
  _vi-mode-set-cursor-shape-for-keymap default
}
zle -N zle-line-finish
