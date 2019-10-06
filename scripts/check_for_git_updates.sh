# Check for new files
git_pull_msg=$(git --git-dir=$DOTFILES_DIR/.git --work-tree=/$DOTFILES_DIR pull 2>&1)

printf "${COLOR_WHITE}Remote Changes: "
if [ "$git_pull_msg" == "Already up to date." ]; then
    printf "${COLOR_RED}NO${COLOR_WHITE}\n"
else
	printf "${COLOR_GREEN}YES${COLOR_WHITE}\n"
	printf "Merge Safe: "
	if [[ $git_pull_msg == *"error: Your local changes to the following files would be overwritten by merge"* ]]; then
		printf "${COLOR_RED}NO${COLOR_WHITE}\n"
		
		# If merge conflict, throw system notifcation
		osascript -e 'display notification "dotfiles repo: merge requiCOLOR_red"'

		# Exit script to avoid adding and commitings files
		exit 0
	else
		printf "${COLOR_GREEN}YES${COLOR_WHITE}\n"
		echo "No merge conflicts... pulling changes..."
	fi
fi

printf "Local Changes: "
if [[ `git --git-dir=$DOTFILES_DIR/.git --work-tree=/$DOTFILES_DIR status --porcelain` ]]; then
  printf "${COLOR_GREEN}YES${NC}\n"
  # Else check if there are pending changes in dotfiles repo
  git_add_msg=$(git --git-dir=$DOTFILES_DIR/.git --work-tree=/$DOTFILES_DIR add .)
  git_commit_msg=$(git --git-dir=$DOTFILES_DIR/.git --work-tree=/$DOTFILES_DIR commit -m "auto commit from script")
  git_push_msg=$(git --git-dir=$DOTFILES_DIR/.git --work-tree=/$DOTFILES_DIR push --quiet)
else
  printf "${COLOR_RED}NO${NC}\n"
fi


