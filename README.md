# dotfiles

clone the repo<br>
`git clone https://github.com/evantayloryates/.dotfiles.git`

cd into the repo<br>
`cd .dotfiles`

duplicate `.local_config_template` and rename to `.local_config`<br>
`cp .local_config_template .local_config`

remove the template file<br>
`rm .local_config_template`

Open the `.local_config` file and edit the values accordingly<br>

Close that file and open your `.bash_profile` file<br>
`open ~/.bash_profile`

Add this code block to the end of the file<br>
```
# Set the path for my .dotfiles repo
DOTFILES="<path-to-cloned-repo>"

# Source .bash_profile in the repo
source $DOTFILES/.bash_profile
```
<br>Make sure to set the `<path-to-cloned-repo>` variable!

Finally, re-source your `.bash_profile`<br>
`source ~/.bash_profile`
