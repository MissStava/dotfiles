
files="bashrc vimrc tmux.conf gitconfig vim scripts tmuxline.snapshot.conf"

for file in $files; do
	ln -sf ~/github/dotfiles/$file ~/.$file
done
