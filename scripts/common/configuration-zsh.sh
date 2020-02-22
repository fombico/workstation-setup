echo
echo "Configuring zsh"
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

echo "Setting git, z plugins"
sed -ie 's/plugins=\(.*\)/plugins=(git z)/g' ~/.zshrc

echo "Copying over fombico.zsh-theme"
cp ../../files/fombico.zsh-theme ~/.oh-my-zsh/themes

echo "Setting theme"
sed -ie 's/ZSH_THEME=".*"/ZSH_THEME="fombico"/g' ~/.zshrc

echo "Setting up git tab completion"
mkdir -p ~/.zsh
cd ~/.zsh

# Download the scripts
curl -o git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -o _git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh

echo -e "
# Load Git tab completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit
" >> ~/.zshrc
