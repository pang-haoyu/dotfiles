setopt no_beep
setopt auto_cd
setopt interactive_comments
setopt extended_glob


HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt append_history
setopt inc_append_history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_verify
setopt hist_ignore_space


bindkey -e


autoload -Uz compinit
zmodload zsh/complist
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format $'%F{yellow}-- %d --%f'
zstyle ':completion:*' matcher-list \
  '' \
  'm:{a-zA-Z}={A-Za-z}' \
  'r:|[._-]=* r:|=*'
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*:approximate:*' max-errors 1
eval "$(dircolors -b)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always {}' --preview-window=right:50%:wrap"
export FZF_ALT_C_OPTS="--preview 'tree -a -C -I \".git|node_modules|.cache\" {} | head -200' --preview-window=right:50%"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"


eval "$(zoxide init zsh)"
__zoxide_z_complete() {
  _cd "$@"
}

compdef __zoxide_z_complete z
compdef __zoxide_z_complete zi


eval "$(starship init zsh)"


source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh


source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh


alias ls='eza --icons --group-directories-first --git'
alias ll='eza -lh --icons --group-directories-first --git'
alias la='eza -a --icons --group-directories-first --git'
alias lt='eza --tree --level=2 --icons'

