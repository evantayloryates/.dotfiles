# dotfiles

clone the repo
`git clone https://github.com/evantayloryates/.dotfiles.git`

cd into the repo
`cd .dotfiles`

duplicate `.local_config_template` and rename to `.local_config`
`cp .local_config_template .local_config`

remove the template file
`rm .local_config_template`

Open the `.local_config` file and edit the values accordingly

Close that file and open your `.bash_profile` file
`open ~/.bash_profile`

Add this code block to the end of the file
```
# Set the path for my .dotfiles repo
DOTFILES="<path-to-cloned-repo>"

# Source .bash_profile in the repo
source $DOTFILES/.bash_profile
```
Make sure to set the `<path-to-cloned-repo>` variable!

Finally, re-source your `.bash_profile`
`source ~/.bash_profile`
