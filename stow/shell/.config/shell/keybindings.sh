# Key bindings for fzf and zoxide, sourced from ~/.shell_init (bash and zsh).
#
#   Ctrl-R  fzf history          Ctrl-T  fzf files
#   Ctrl-G  fzf directories      Ctrl-S  pick an ssh host and connect
#   Ctrl-Z  zoxide interactive pick (zi)
#
# Needs $SHELL_NAME (bash|zsh), set by ~/.shell_init. Interactive shells only.
case $- in *i*) ;; *) return 0 2>/dev/null ;; esac

command -v fzf >/dev/null 2>&1 || return 0

# Hosts from ~/.ssh/config (no wildcard patterns).
__ssh_hosts() {
  awk '$1 == "Host" { for (i = 2; i <= NF; i++) if ($i !~ /[*?!]/) print $i }' \
    ~/.ssh/config ~/.ssh/config.d/* 2>/dev/null | sort -u
}

if [ "$SHELL_NAME" = zsh ]; then
  unsetopt flow_control   # let Ctrl-S reach the line editor

  ssh-pick-widget() {
    local host
    host=$(__ssh_hosts | fzf --height 40% --reverse --prompt 'ssh> ') || { zle reset-prompt; return; }
    BUFFER="ssh $host"
    zle accept-line
  }
  # Runs zi on a fresh prompt and restores whatever was typed afterwards.
  zoxide-pick-widget() {
    zle push-line
    BUFFER=' zi'
    zle accept-line
  }
  zle -N ssh-pick-widget
  zle -N zoxide-pick-widget

  (( $+widgets[fzf-history-widget] )) && bindkey '^R' fzf-history-widget
  (( $+widgets[fzf-file-widget] )) && bindkey '^T' fzf-file-widget
  (( $+widgets[fzf-cd-widget] )) && bindkey '^G' fzf-cd-widget
  bindkey '^S' ssh-pick-widget
  command -v zoxide >/dev/null 2>&1 && bindkey '^Z' zoxide-pick-widget
else
  # Let Ctrl-S and Ctrl-Z reach readline. Ctrl-Z no longer suspends foreground jobs.
  stty -ixon susp undef 2>/dev/null

  __ssh_pick() {
    local host
    host=$(__ssh_hosts | fzf --height 40% --reverse --prompt 'ssh> ') || return
    READLINE_LINE="ssh $host"
    READLINE_POINT=${#READLINE_LINE}
  }
  # Private key runs the picker; the macro on Ctrl-S then presses Enter.
  bind -m emacs-standard -x '"\C-x\C-s": __ssh_pick'
  bind -m emacs-standard '"\C-s": "\C-x\C-s\C-m"'
  command -v zoxide >/dev/null 2>&1 && bind -m emacs-standard '"\C-z": "\C-e\C-u zi\C-m"'
  # Ctrl-R and Ctrl-T come from `fzf --bash`; Ctrl-G reuses fzf's Alt-C macro.
  __fzf_cd_macro=$(bind -m emacs-standard -s 2>/dev/null | sed -n 's/^"\\ec": //p')
  [ -n "$__fzf_cd_macro" ] && bind -m emacs-standard "\"\\C-g\": $__fzf_cd_macro"
  unset __fzf_cd_macro
fi
