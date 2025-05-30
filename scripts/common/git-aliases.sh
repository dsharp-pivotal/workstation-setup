echo
echo "Setting up Git aliases..."
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.lg "log --graph --pretty=format:'%C(dim white)%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
