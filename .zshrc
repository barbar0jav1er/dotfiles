
export ZSH="$HOME/.oh-my-zsh"
source /opt/homebrew/opt/spaceship/spaceship.zsh

source $ZSH/oh-my-zsh.sh

# ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"

plugins=(  
  git
  kubectl
  argocd
  fnm)

alias cls="clear"


# fnm
FNM_PATH="/Users/bjvalmaseda/Library/Application Support/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/Users/bjvalmaseda/Library/Application Support/fnm:$PATH"
  eval "`fnm env`"
fi

eval "$(fnm env --use-on-cd --shell zsh)"

argocd_login() {
  local HOST="localhost:8080"
  local USER="admin"
  local PASS=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)

  echo "🔐 Logging into ArgoCD at $HOST as $USER"
  argocd login "$HOST" \
    --username "$USER" \
    --password "$PASS" \
    --grpc-web \
    --insecure
}