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

if [[ -n ${LS_COLORS:-} ]]; then
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi


# fzf
# Generic source for plain fzf invocations.
export FZF_DEFAULT_COMMAND='fd --hidden --exclude .git'

# Shared appearance for all fzf pickers.
# - Bottom prompt
# - Partial-height window
# - Outer border
# - Catppuccin Mocha colors
export FZF_DEFAULT_OPTS=" \
--layout=default \
--height=40% \
--min-height=20+ \
--border \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"

# Ctrl-T: find files.
export FZF_CTRL_T_COMMAND='fd --type f --hidden --exclude .git'
export FZF_CTRL_T_OPTS="
  --preview 'bat --style=numbers --color=always --line-range=:500 {}'
  --preview-window=right:50%:wrap
"

# Ctrl-R: search shell history.
export FZF_CTRL_R_OPTS=""

# Alt-C: find directories and cd into them.
export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git'
export FZF_ALT_C_OPTS="
  --preview 'tree -a -C -I \".git|node_modules|.cache\" {} | head -200'
  --preview-window=right:50%
"

# Ctrl-G: live grep file contents.
fzf-grep-widget() {
  local rg_cmd="rg --hidden --glob '!.git' --line-number --no-heading --color=always --smart-case"

  FZF_DEFAULT_COMMAND="$rg_cmd ''" \
    fzf \
      --ansi \
      --disabled \
      --delimiter=: \
      --bind "change:reload:$rg_cmd {q} || true" \
      --preview 'bat --style=numbers --color=always --highlight-line {2} {1}' \
      --preview-window='right:50%:wrap:+{2}-/2'

  zle reset-prompt
}

zle -N fzf-grep-widget
bindkey '^G' fzf-grep-widget

# Load fzf shell integration after defining its options.
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

alias disks='lsblk -o NAME,MODEL,SERIAL,SIZE,TYPE,TRAN,FSTYPE,LABEL,MOUNTPOINTS'
alias ipaddr='ip -br addr'
alias routes='ip route'
alias lanscan='sudo arp-scan --localnet --ouifile=/usr/share/arp-scan/ieee-oui.txt --macfile=/etc/arp-scan/mac-vendor.txt'
alias targz='tar -czf'
alias untargz='tar -xzf'
alias now='date +"%A, %d %B %Y - %I:%M %p"'
alias cal='ncal -b -M'
alias calc='qalc'
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

printf '\n\n\n'
fastfetch
printf '\n\n\n'
