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
  # Else check if there are pending changes in dotfiles repo
  echo "Adding all files..."
  git_add_msg=$(git --git-dir=$DOTFILES_DIR/.git --work-tree=/$DOTFILES_DIR add .)
  echo "Commiting files..."
  git_commit_msg=$(git --git-dir=$DOTFILES_DIR/.git --work-tree=/$DOTFILES_DIR commit -m "auto commit from script")
  echo "Pushing commit..."
  git_push_msg=$(git --git-dir=$DOTFILES_DIR/.git --work-tree=/$DOTFILES_DIR push --quiet)
else
  echo "No local dotfile changes"
fi


