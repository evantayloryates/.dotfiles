# Check for new files
git_pull_msg=$(git --git-dir=$DOTFILES_DIR/.git --work-tree=/$DOTFILES_DIR pull 2>&1)


if [ "$git_pull_msg" == "Already up to date." ]; then
    echo "No dotfile changes detected"
else
	echo "Dotfile changes detected"
	if [[ $git_pull_msg == *"error: Your local changes to the following files would be overwritten by merge"* ]]; then
		echo "Merge error anticipated"
		
		# If merge conflict, throw system notifcation
		osascript -e 'display notification "dotfiles repo: merge required"'

		# Exit script to avoid adding and commitings files
		exit 0
	else
		echo "No merge conflicts... pulling changes..."
	fi
fi

if [[ `git --git-dir=$DOTFILES_DIR/.git --work-tree=/$DOTFILES_DIR status --porcelain` ]]; then
  echo "Local changes detected"
else
  echo "No local changes"
fi

# Else check if there are pending changes in dotfiles repo
git --git-dir=$DOTFILES_DIR/.git --work-tree=/$DOTFILES_DIR status

echo "test"
