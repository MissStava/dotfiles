


dir=~/github/dotfiles
olddir=~/github/dotfiles_old
files="bashrc vimrc tmux.conf gitconfig vim scripts tmuxline.snapshot.conf"

mkdir -p $olddir
cd $dir

for file in $files; do
	mv ~/.$file $olddir/
	ln -s $dir/$file ~/.$file
done
