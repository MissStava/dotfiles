
files="bashrc vimrc tmux.conf gitconfig vim scripts tmuxline.snapshot.conf"

for file in $files; do
	ln -sf ~/git/github.com/dotfiles/$file ~/.$file
done
