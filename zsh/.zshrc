# Shell options
setopt no_beep
setopt auto_cd
setopt interactive_comments
setopt extended_glob


# PATH
# Keep entries unique when .zshrc is re-sourced.
typeset -U path PATH
path=("$HOME/.opencode/bin" "${path[@]}")


# History
HISTSIZE=20000
SAVEHIST=10000
HISTFILE="$HOME/.zsh_history"

setopt share_history
setopt hist_ignore_all_dups
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_save_no_dups
setopt hist_reduce_blanks
setopt hist_verify
setopt hist_ignore_space


# Emacs-style keybindings
bindkey -e


# Completion
autoload -Uz compinit
zmodload -i zsh/complist
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format $'%F{yellow}-- %d --%f'

# Exact -> case-insensitive -> forgiving separators.
zstyle ':completion:*' matcher-list \
  '' \
  'm:{a-zA-Z}={A-Za-z}' \
  'r:|[._-]=* r:|=*'

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*:approximate:*' max-errors 1


# Completion colors
if (( $+commands[dircolors] )); then
  eval "$(dircolors -b)"
fi

[[ -n ${LS_COLORS:-} ]] &&
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}


# fzf
export FZF_DEFAULT_COMMAND='fd --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'

export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range=:500 {}' --preview-window=right:50%:wrap"

export FZF_ALT_C_OPTS="--preview 'tree -a -C -I \".git|node_modules|.cache\" {} | head -200' --preview-window=right:50%"

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"

[[ -r "$HOME/.fzf.zsh" ]] && source "$HOME/.fzf.zsh"


# zoxide
# Must be after compinit for zoxide's native completion.
(( $+commands[zoxide] )) && eval "$(zoxide init zsh)"


# Aliases
alias ls='eza --icons --group-directories-first --git'
alias ll='eza -lh --icons --group-directories-first --git'
alias la='eza -a --icons --group-directories-first --git'
alias lla='eza -lha --icons --group-directories-first --git'
alias lt='eza --tree --level=2 --icons'
alias storage='lsblk -o NAME,MODEL,SERIAL,SIZE,TYPE,TRAN,FSTYPE,MOUNTPOINTS'
alias network='ip -br addr'
alias reloadzsh='source ~/.zshrc'


# Prompt
(( $+commands[starship] )) && eval "$(starship init zsh)"


# Autosuggestions
[[ -r /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] &&
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh


# Syntax highlighting theme
# Catppuccin must be loaded before zsh-syntax-highlighting.
[[ -r "$HOME/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh" ]] &&
  source "$HOME/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh"


# Syntax highlighting
# Keep this last.
[[ -r /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] &&
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
