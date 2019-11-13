# dotfiles

1. clone the repo<br>
`git clone https://github.com/evantayloryates/.dotfiles.git`

2. cd into the repo<br>
`cd .dotfiles`

3. duplicate `.local_config_template` and rename to `.local_config`<br>
`cp .local_config_template .local_config`

4. remove the template file<br>
`rm .local_config_template`

5. Open the `.local_config` file and edit the values accordingly<br>

6. Close that file and open your `.bash_profile` file<br>
`open ~/.bash_profile`

7. Add this code block to the end of the file<br>
```
# Set the path for my .dotfiles repo
DOTFILES="<path-to-cloned-repo>"

# Source .bash_profile in the repo
source $DOTFILES/.bash_profile
```
NOTE: Make sure to set the `<path-to-cloned-repo>` variable!

8. Finally, re-source your `.bash_profile`<br>
`source ~/.bash_profile`
