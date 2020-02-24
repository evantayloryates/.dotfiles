DEFAULT_COMMIT_MESSAGE="Auto commited changes from scripts"
read -p 'Commit? [y]/n: ' should_commit
  if [ -z "$should_commit" ] || [ "$should_commit" == "y" ]; then 
  	
  	read -p 'Commit message? [n]/<your-message>: ' commit_msg
	if [ -z "$commit_msg" ] || [ "$commit_msg" == "n" ]; then 
		commit_msg="$DEFAULT_COMMIT_MESSAGE";
	fi

	echo $commit_msg
fi