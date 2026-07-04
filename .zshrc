# ============================================================
# Powerlevel10k Instant Prompt
# ============================================================
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# ============================================================
# Oh My Zsh
# ============================================================
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  # other plugins...
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# ============================================================
# Completions & Tools
# ============================================================
# zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/linziyou/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/linziyou/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/linziyou/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/linziyou/google-cloud-sdk/completion.zsh.inc'; fi


# ============================================================
# Custom Functions
# ============================================================
# Brewfile
brew_dump () {
    brew bundle dump --describe
}
brew_dump_force () {
    brew bundle dump --describe --force
}
brew_bundle_restore () {
    brew bundle --file ~/.dotfiles/Brewfile
}

# Java
list_java () {
    echo "execute bash command:\n/usr/libexec/java_home -V\n"
    /usr/libexec/java_home -V
}

# Kubernetes
kubectl_deployments () {
    kubectl get deployments --all-namespaces=true
}
kubectl_deployment_in_namespace () { # $1: namespace
    kubectl get deployments -n $1
}
kubectl_pods_in_namespace () { # $1: namespace
    kubectl get pods -n $1
}
kubectl_logs_in_pod () { # $1: pod, $2: namespace
    kubectl logs -f $1 -n $2
}
kubectl_logs_in_app () { # $1: app-label, $2: namespace
    kubectl logs -f -l app=$1 -n $2
}
kubectl_exec_in_pod () { # $1: namespace, $2: pod, $3: command
    kubectl exec -n $1 $2 -- $3
}
kubectl_exec_bash_in_pod () { # $1: namespace, $2: pod
    kubectl exec -it $1 -n $2 -- /bin/bash
}
kubectl_port_forward_in_pod () { # $1: pod, $2: port, $3: port to forward, $4: namespace
    kubectl port-forward pod/$1 $2:$3 -n $4
}
stern_logs() { # $1: pod-name-pattern, $2: namespace
    stern $1 -n $2
}

# Claude Bedrock
claude_switch_settings() {
    local d="$HOME/.claude"
    local active="$d/settings.json"
    local marker="$d/.settings_profile"
    local backup="$d/settings.json.bak"
    local name="$1"

    if [ -z "$name" ]; then
        echo "usage: claude_switch_settings {status|clear|<名稱>}"; return 1
    fi

    case "$name" in
        status)
            if [ -f "$marker" ]; then
                local cur; cur="$(cat "$marker")"
                echo "current: $cur"
                [ -f "$d/settings.$cur.json" ] || echo "warning: settings.$cur.json 不存在，無法重新套用"
            else
                echo "current: 尚未套用任何 profile"
            fi
            return 0 ;;
        clear)
            [ -f "$backup" ] && cp "$backup" "$active"
            for f in "$d"/settings.*.json; do
                [ -e "$f" ] || continue
                [ "$f" = "$d/settings.local.json" ] && continue
                rm -f "$f"
            done
            rm -f "$marker" "$backup"
            echo "已還原並清除所有 profile，只保留 settings.json，重啟 Claude Code 生效"
            return 0 ;;
    esac

    local target="$d/settings.$name.json"
    if [ ! -f "$target" ]; then
        printf "settings.%s.json 不存在，要從目前 settings.json 複製建立嗎? [y/N] " "$name"
        read -r ans
        case "$ans" in
            y|Y)
                cp "$active" "$target" && echo "已建立 settings.$name.json"
                if [ -n "$EDITOR" ]; then "$EDITOR" "$target"
                elif command -v open >/dev/null 2>&1; then open "$target"
                elif command -v xdg-open >/dev/null 2>&1; then xdg-open "$target"
                else echo "請手動編輯: $target"; fi
                echo "編輯存檔後，再執行 claude_switch_settings $name 套用"
                return 0 ;;
            *)  echo "取消"; return 1 ;;
        esac
    fi

    [ -f "$backup" ] || cp "$active" "$backup"
    cp "$target" "$active" \
        && printf '%s' "$name" > "$marker" \
        && echo "已套用 $name，重啟 Claude Code 生效"
}

# Added by codebase-memory-mcp install
export PATH="/Users/linziyou/.local/bin:$PATH"
