echo
echo "Configuring zsh"
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

echo "Setting git, z plugins"
sed -ie 's/plugins=\(.*\)/plugins=(git z)/g' ~/.zshrc

echo "Copying over fombico.zsh-theme"
cp ../../files/fombico.zsh-theme ~/.oh-my-zsh/themes

echo "Setting theme"
sed -ie 's/ZSH_THEME=".*"/ZSH_THEME="fombico"/g' ~/.zshrc