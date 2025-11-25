
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
export JAVA_HOME_25=$(/usr/libexec/java_home -v25)
# Java 8
# export JAVA_HOME=$JAVA_HOME_8
# Java 11
# export JAVA_HOME=$JAVA_HOME_11
# Java 17
# export JAVA_HOME=$JAVA_HOME_17
# Java 25
export JAVA_HOME=$JAVA_HOME_25

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Flutter
export PATH="/Users/linziyou/fvm/versions/stable/bin:$PATH"

# Added by Toolbox App
export PATH="$PATH:/Users/linziyou/Library/Application Support/JetBrains/Toolbox/scripts"

# ADB
export ANDROID_HOME=/Users/linziyou/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools

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
kubectl_exec_in_pod () { # $1: namespace, $2: pod, $3: command
    kubectl exec -n $1 $2 -- $3
}
kubectl_exec_bash_in_pod () { # $1: namespace, $2: pod
    kubectl exec -it $1 -n $2 -- /bin/bash
}
kubectl_port_forward_in_pod () { # $1: pod, $2: port, $3: port to forward, $4: namespace
    kubectl port-forward pod/$1 $2:$3 -n $4
}
