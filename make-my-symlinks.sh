


dir=~/github/dotfiles
files="bashrc vimrc tmux.conf gitconfig vim scripts tmuxline.snapshot.conf"

mkdir -p $olddir
cd $dir

for file in $files; do
	ln -s $dir/$file ~/.$file
done
