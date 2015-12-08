


dir=~/dotfiles
olddir=~/dotfiles_old
files="bashrc vimrc tmux.conf gitconfig vim scripts"

mkdir -p $olddir
cd $dir

for file in $files; do
	mv ~/.$file ~/dotfiles_old/
	ln -s $dir/$file ~/.$file
done
