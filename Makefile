## Define the stow command for the UltiSnips directory {{{

## Run stow for a package
stow-ultisnips:
	rm -rf ~/.config/nvim/UltiSnips
	mkdir -p ~/.config/nvim/UltiSnips
	stow UltiSnips -t ~/.config/nvim/UltiSnips

# }}}

## Composite rules {{{

## Run stow for all rules for all subdirectories that are stow-able
stow: stow-ultisnips

## Create directories and stow all of the tmuxinator in correct directory
ultisnips: stow

# }}}

## Help {{{

## Display a help message listing all tasks
help:
	make -rpn | sed -n -e '/^$$/ { n ; /^[^ .#][^ ]*:/ { s/:.*$$// ; p ; } ; }' | sort -u

# }}}

## Default {{{

## Specify that the default is full installation of the tmuxinator
.DEFAULT_GOAL := ultisnips

# }}}
