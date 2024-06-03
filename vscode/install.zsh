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

	# backup the existing file, unless it is a symlink
	if [ -f "$dest" ] && [ ! -L "$dest" ]; then
		echo "Backing up $dest to $backup"
		mv "$dest" "$backup"
	fi

	# if there is not a symlink, create one
	if [ ! -L "$dest" ]; then
		echo "Creating symlink $dest"
		ln -s "$src" "$dest"
	fi
done
