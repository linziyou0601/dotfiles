
eval "$(/opt/homebrew/bin/brew shellenv)"


# ============================================================
# Java
# ============================================================
export JAVA_HOME_8=$(/usr/libexec/java_home -v1.8)
export JAVA_HOME_11=$(/usr/libexec/java_home -v11)
export JAVA_HOME_17=$(/usr/libexec/java_home -v17)
export JAVA_HOME_25=$(/usr/libexec/java_home -v25)
# Java 8
# export JAVA_HOME=$JAVA_HOME_8
# Java 11
# export JAVA_HOME=$JAVA_HOME_11
# Java 17
# export JAVA_HOME=$JAVA_HOME_17
# Java 25
export JAVA_HOME=$JAVA_HOME_25


# ============================================================
# Node Version Manager
# ============================================================
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# ============================================================
# SDK & Tools PATH
# ============================================================
# Flutter
export PATH="/Users/linziyou/fvm/versions/stable/bin:$PATH"

# Added by Toolbox App
export PATH="$PATH:/Users/linziyou/Library/Application Support/JetBrains/Toolbox/scripts"

# ADB
export ANDROID_HOME=/Users/linziyou/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools

# uv
export PATH="$HOME/.local/bin:$PATH"

# Obsidian
export PATH="$PATH:/Applications/Obsidian.app/Contents/MacOS"


# ============================================================
# Locale
# ============================================================
export LANG="zh_TW.UTF-8"
export LC_COLLATE="zh_TW.UTF-8"
export LC_CTYPE="zh_TW.UTF-8"
export LC_MESSAGES="zh_TW.UTF-8"
export LC_MONETARY="zh_TW.UTF-8"
export LC_NUMERIC="zh_TW.UTF-8"
export LC_TIME="zh_TW.UTF-8"
