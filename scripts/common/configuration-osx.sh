echo
echo 'Customizing OS X configuration'

# set menu clock
# see https://github.com/tech-otaku/menu-bar-clock
killall 'System Settings' 2>/dev/null || true
defaults write com.apple.menuextra.clock.plist DateFormat -string 'EEE d MMM h:mm:ss a'
defaults write com.apple.menuextra.clock.plist ShowDayOfWeek -bool true
defaults write com.apple.menuextra.clock.plist ShowDate -int 1
defaults write com.apple.menuextra.clock.plist Show24Hour -bool false
defaults write com.apple.menuextra.clock.plist ShowSeconds -bool true
defaults write com.apple.menuextra.clock.plist ShowAMPM -bool true
killall ControlCenter

# hide the dock
#defaults write com.apple.dock autohide -bool true
#killall Dock

# disable spaces/desktops from reordering themselves
defaults write com.apple.dock "mru-spaces" -bool false
killall Dock

# fast key repeat rate, requires reboot to take effect
defaults write ~/Library/Preferences/.GlobalPreferences KeyRepeat -int 1
defaults write ~/Library/Preferences/.GlobalPreferences InitialKeyRepeat -int 15

# set finder to display full path in title bar
defaults write com.apple.finder '_FXShowPosixPathInTitle' -bool true

# stop Photos from opening automatically
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true
#to revert use defaults -currentHost delete com.apple.ImageCapture disableHotPlug

# modify appearance of dock: remove standard icons, add chrome and iTerm
if ! hash dockutil ; then
  # dockutil is not installed
  brew install dockutil
fi
#dockutil --list | awk -F\t '{print "dockutil --remove \""$1"\" --no-restart"}' | sh
dockutil --add /Applications/Google\ Chrome.app --no-restart
dockutil --add /Applications/iTerm.app

# Force Preference Refresh
killall -u $USER cfprefsd

echo
echo "Configuring iTerm"
#cp files/com.googlecode.iterm2.plist ~/Library/Preferences

echo "Configuring Rectangle"
cp files/com.knollsoft.Rectangle.plist ~/Library/Preferences/com.knollsoft.Rectangle.plist
open /Applications/Rectangle.app

#echo "Configuring FlyCut"
#open /Applications/Flycut.app
