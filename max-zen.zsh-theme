# --- 左侧提示符 (PROMPT) ---
PROMPT='%B%F{white}%n%b%F{cyan}@%m%F{white}:%B%F{green}[%~]%b'
PROMPT+=' $(git_prompt_info)'
PROMPT+='
%F{white}> %f'

# --- 右侧提示符 (RPROMPT) ---
RPROMPT=$'%{\e[1A%}%F{white}|%F{magenta}%D{%H:%M:%S}%F{white}|%{\e[1B%}'

# --- Git 样式设置 ---
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
