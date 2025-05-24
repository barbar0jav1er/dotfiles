DOTFILES=(.gitconfig .gitignore .zshrc)

for dotfile in "${DOTFILES[@]}"; do
    cp -v "$HOME/dotfiles/$dotfile" "$HOME/$dotfile"
done
