cd

wget --no-check-certificate https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-dark 
wget --no-check-certificate https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-light

mv dircolors.ansi-light ~/.dircolors
mv dircolors.ansi-dark ~/.dircolors

eval `dircolors ~/.dircolors`

sudo apt-get install git-core

rm -rf .gnome-terminal-colors-solarized

git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git .gnome-terminal-colors-solarized

cd .gnome-terminal-colors-solarized

./set_dark.sh
