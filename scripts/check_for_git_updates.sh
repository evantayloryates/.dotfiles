# Check for new files
git --git-dir=$DOTFILES_DIR/.git --work-tree=/$DOTFILES_DIR pull

# If merge conflict, throw system notifcation
osascript -e 'display notification "Dofiles merge required!"'

# Else check if there are pending changes in dotfiles repo
git --git-dir=$DOTFILES_DIR/.git --work-tree=/$DOTFILES_DIR status