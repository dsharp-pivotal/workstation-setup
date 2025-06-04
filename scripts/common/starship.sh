brew install starship || true
brew install --cask font-roboto-mono-nerd-font || true

echo "Setting iterm2 Default profile's font to a nerd font"
echo "Note: This may not work if running this with iterm2 running, as the app will overwrite the preferences on exit"
/usr/libexec/PlistBuddy ~/Library/Preferences/com.googlecode.iterm2.plist \
    -c 'Set ":New Bookmarks:Default:Normal Font" "RobotoMonoNFM-Rg 12"'

cp files/starship.toml ~/.config/starship.toml
init='eval "$(starship init zsh)"'
if ! grep -qF "$init" ~/.zshrc ; then 
    echo "$init" >> ~/.zshrc
fi
