echo
echo "Configuring iTerm"
cp files/com.googlecode.iterm2.plist ~/Library/Preferences

echo "Configuring ShiftIt"
open /Applications/ShiftIt.app

echo "Configuring FlyCut"
open /Applications/Flycut.app

echo "Configuring sublime alias"
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/sublime

# echo
# echo "Installing vim configuration"
# pushd ~/
# if [ ! -d ~/.vim ]; then
#     git clone https://github.com/pivotal/vim-config.git ~/.vim
#     ~/.vim/bin/install
# fi
# popd


