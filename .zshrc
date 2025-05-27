
export ZSH="$HOME/.oh-my-zsh"
CASE_SENSITIVE="true"

eval "$(fnm env --use-on-cd --shell zsh)"

plugins=(  
  git
  kubectl
  argocd
  fnm
)

source $ZSH/oh-my-zsh.sh

source /opt/homebrew/opt/spaceship/spaceship.zsh
# Custom Aliases
alias cls="clear"

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
