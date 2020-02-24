DEFAULT_COMMIT_MESSAGE="Auto commited changes from scripts"

# Check for new files
git_pull_msg=$(git --git-dir=$DOTFILES_DIR/.git --work-tree=/$DOTFILES_DIR pull 2>&1)

printf "${COLOR_WHITE}Remote Changes: "

if [ "$git_pull_msg" == "Already up to date." ]; then
    printf "${COLOR_RED}NO${COLOR_WHITE}\n"

elif [ "$git_pull_msg" == "Already up-to-date." ]; then
    printf "${COLOR_RED}NO${COLOR_WHITE}\n"

else
	printf "${COLOR_GREEN}YES${COLOR_WHITE}\n"
	printf "Merge Safe: "
	if [[ $git_pull_msg == *"error: Your local changes to the following files would be overwritten by merge"* ]]; then
		printf "${COLOR_RED}NO${COLOR_WHITE}\n"
		
		# # If merge conflict, throw system notifcation
		# osascript -e 'display notification "dotfiles repo: merge requiCOLOR_red"'

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
  
  printf "\nFILES CHANGED::\n\n"
  git --git-dir=$DOTFILES_DIR/.git --work-tree=/$DOTFILES_DIR status --porcelain | sed 's/^/  /'
  
  # add a new line for formatting
  echo

  read -p "Commit? [y]/n: " should_commit
  if [ -z "$should_commit" ] || [ "$should_commit" == "y" ]; then 
  	
  	read -p 'Commit message? [n]/<your-message>: ' commit_msg
	if [ -z "$commit_msg" ] || [ "$commit_msg" == "n" ]; then 
		commit_msg="$DEFAULT_COMMIT_MESSAGE";
	fi

	printf "COMMIT MESSAGE: ${commit_msg}"
	
	# Git add all
	git_add_msg=$(git --git-dir=$DOTFILES_DIR/.git --work-tree=/$DOTFILES_DIR add -A)
	
	# Git commit with message
	git_commit_msg=$(git --git-dir=$DOTFILES_DIR/.git --work-tree=/$DOTFILES_DIR commit -m "$commit_msg")
	
	# Git push
	git_push_msg=$(git --git-dir=$DOTFILES_DIR/.git --work-tree=/$DOTFILES_DIR push)
	# git_push_msg=$(git --git-dir=$DOTFILES_DIR/.git --work-tree=/$DOTFILES_DIR push --quiet)
  fi

else
  printf "${COLOR_RED}NO${NC}\n"
fi


