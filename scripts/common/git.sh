echo
echo "Installing Git and associated tools"
brew install git git-gui git-lfs git-crypt

echo
echo "Setting global Git configurations"
#git config --global core.editor "$(brew --prefix)/bin/vim"
git config --global transfer.fsckobjects true
git config --global commit.verbose true
git config --global rebase.autosquash true
git config --global rebase.autostash true
git config --global rebase.updateRefs true

git config --global core.pager "cat"
git config --global pager.diff "less -FX"
git config --global pager.show "less -FX"
