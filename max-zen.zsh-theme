# --- 左侧提示符 (PROMPT) ---
PROMPT='%B%F{white}%n%b%F{cyan}@%m%F{white}:%B%F{green}[%~]%b'
PROMPT+=' $(git_prompt_info)'
PROMPT+='
%F{white}> %f'

# --- 右侧提示符 (RPROMPT): 显示上一条命令的执行耗时 ---
ZLE_RPROMPT_INDENT=0   # 去掉 zsh 默认预留的右侧空隙
RPROMPT=$'%{\e[1A%}%F{magenta}${ZEN_LAST_DURATION}%{\e[1B%}'

# --- 命令计时 ---
zmodload zsh/datetime
typeset -g ZEN_LAST_DURATION=""
typeset -g _ZEN_CMD_START=""

_zen_preexec() {
  _ZEN_CMD_START=${EPOCHREALTIME:-$EPOCHSECONDS}
}

_zen_precmd() {
  if [[ -n $_ZEN_CMD_START ]]; then
    local now=${EPOCHREALTIME:-$EPOCHSECONDS}
    local elapsed=$(( now - _ZEN_CMD_START ))
    _ZEN_CMD_START=""
    if (( elapsed < 0.1 )); then
      ZEN_LAST_DURATION=""                                # 瞬时命令不显示
    elif (( elapsed < 60 )); then
      ZEN_LAST_DURATION=$(printf '%.1fs' $elapsed)        # 如 3.2s
    else
      ZEN_LAST_DURATION=$(printf '%dm%02ds' $((elapsed/60)) $((elapsed%60)))  # 如 1m05s
    fi
  fi
}

autoload -Uz add-zsh-hook
add-zsh-hook preexec _zen_preexec
add-zsh-hook precmd _zen_precmd

# --- Git 样式设置 ---
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
