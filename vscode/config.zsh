# create symlinks for VSCode keybindings & settings

VSCODE_APP="$HOME/Library/Application Support/Code/User"

vscode_files=(
	"keybindings.json"
	"settings.json"
)

for file in "${vscode_files[@]}"; do

	src="$ZSHDOT/vscode/$file"
	dest="$VSCODE_APP/$file"
	backup="$dest.backup"

	# backup the existing file, if it exists
	if [ -f "$dest" ]; then
		echo "Backing up $dest to $backup"
		mv "$dest" "$backup"
	fi

	# remove the existing symlink, if it exists
	if [ -L "$dest" ]; then
		echo "Removing symlink $dest"
		rm "$dest"
	fi

	# create the symlink
	echo "Creating symlink $dest"
	ln -s "$src" "$dest"
done
