# Dev - Development enviromment and machine setup
Use for configuring development tools

## Contents
* **.vimrc** -- vim config file
* **get-vimrc.sh** -- Shell script which copies the users .vimrc file into this
folder. When altering the .vimrc, alter the file in the users directory, (not 
the one here) and then run this scrip to copy for saving the file to the repo.

## Troubleshooting
### 'cmp' not found
Full error message: *E5108: Error executing lua [string ":lua"]:2: module 'cmp not found*
* **Cause:** One of the cmp vim pluggins has not installed correclty. This is likley due to certificate / zscaler problems.
*
