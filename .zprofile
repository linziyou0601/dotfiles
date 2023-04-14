
eval "$(/opt/homebrew/bin/brew shellenv)"

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

# Java Home
list_java () {
    echo "execute bash command:\n/usr/libexec/java_home -V\n"
    /usr/libexec/java_home -V
}
export JAVA_HOME_8=$(/usr/libexec/java_home -v1.8)
export JAVA_HOME_11=$(/usr/libexec/java_home -v11)
export JAVA_HOME_17=$(/usr/libexec/java_home -v17)
# Java 8
# export JAVA_HOME=$JAVA_HOME_8
# Java 11
# export JAVA_HOME=$JAVA_HOME_11
# Java 17
export JAVA_HOME=$JAVA_HOME_17

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Flutter
export PATH="/Users/linziyou/fvm/versions/stable/bin:$PATH"

# Added by Toolbox App
export PATH="$PATH:/Users/linziyou/Library/Application Support/JetBrains/Toolbox/scripts"

# 此段語法需要miniforge3
# 快捷語法建立x86_x64或arm架構的conda環境並同時安裝該架構的python
conda_create_x64_env () {
    # 範例：conda_create_x64_env myx64env python=3.10 
    CONDA_SUBDIR=osx-64 conda create -n $@ 
}
conda_create_arm_env () {
    # 範例：conda_create_arm_env myenv_x86 python=3.10 
    CONDA_SUBDIR=osx-arm64 conda create -n $@ 
}
conda_set_env () {
    # 範例：conda_set_env osx-64
    conda config --env --set subdir $@ 
}