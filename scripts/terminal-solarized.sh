cd

wget --no-check-certificate https://raw.github.com/seebi/dircolors-solarized/master/dircolors.ansi-light
wget --no-check-certificate https://raw.github.com/seebi/dircolors-solarized/master/dircolors.ansi-dark

mv dircolors.ansi-light ~/.dircolors
mv dircolors.ansi-dark ~/.dircolors

eval `dircolors ~/.dircolors`

sudo apt-get install git-core

git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git .gnome-terminal-colors-solarized

cd .gnome-terminal-colors-solarized

./set_dark.sh
