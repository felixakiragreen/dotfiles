# Sets reasonable macOS defaults.
#
# Or, in other words, set shit how I like in macOS.
#
# The original idea (and a couple settings) were grabbed from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.macos
#
# Run ./set-defaults.sh and you'll be good to go.

# INITIALIZE

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# General UI/UX - Global                                                      #
###############################################################################

# [System Preferences > General]

# Set global appearance (`Dark`, `Light`, or `Auto`)
defaults write -globalDomain AppleInterfaceStyle -string "Dark"

# Set accent color to green (3)
defaults write -globalDomain AppleAccentColor -int 3

# Set highlight color to green
defaults write -globalDomain AppleHighlightColor -string "0.752941 0.964706 0.678431 Green"

# Set sidebar icon size to small (1), medium (2), large (3)
defaults write -globalDomain NSTableViewDefaultSizeMode -int 2

# Set scrollbar visibility (`WhenScrolling`, `Automatic` and `Always`)
defaults write -globalDomain AppleShowScrollBars -string "WhenScrolling"

# Set keyboard repeat to on
defaults write NSGlobalDomain KeyRepeat -bool true
# Set keyboard repeat delay to 100ms
defaults write com.apple.Accessibility KeyRepeatDelay -float 0.1
# Set keyboard repeat interval to 1ms
defaults write com.apple.Accessibility KeyRepeatInterval -float 0.001

# Close windows when quiting an app
# We do this to enable: https://www.iterm2.com/documentation-restoration.html
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool true

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write -globalDomain com.apple.mouse.tapBehavior -int 1
defaults write -globalDomain com.apple.mouse.tapBehavior -int 1

# Bluetooth: Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write -globalDomain AppleKeyboardUIMode -int 3

# Use scroll gesture with the Ctrl (^) modifier key to zoom
sudo defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true # enable
sudo defaults write com.apple.universalaccess closeViewScrollWheelModifiersInt -int 262144 # set to ^

# Set language and text formats
defaults write -globalDomain AppleLanguages -array "en"
defaults write -globalDomain AppleLocale -string "en_US"
# Set first day of week to the correct day of the week (Monday)
defaults write -globalDomain AppleFirstWeekday -dict gregorian -int 2
# Set time to 24 hours
defaults write -globalDomain AppleICUForce24HourTime -bool true
# Set units to metric
defaults write -globalDomain AppleMeasurementUnits -string "Centimeters"
defaults write -globalDomain AppleTemperatureUnit -string "Celsius"
defaults write -globalDomain AppleMetricUnits -bool true

###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Speed up dock show
defaults write com.apple.dock autohide-delay -float 0

# Remove the delay for showing the Dock in full screen"
defaults write com.apple.dock autohide-fullscreen-delayed -bool false

# Minimize in application
defaults write com.apple.dock minimize-to-application -bool true

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 1048576 is ⌘ I think

# Top left screen corner → Desktop
defaults write com.apple.dock wvous-tl-corner -int 4
defaults write com.apple.dock wvous-tl-modifier -int 1048576 # ⌘

# Bottom left screen corner → Start screen saver
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 1048576 # ⌘

###############################################################################
# Finder                                                                      #
###############################################################################

# New finder window:
# Set Home as the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Finder: show all filename extensions
defaults write -globalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Show Path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Show the ~/Library folder.
chflags nohidden ~/Library

# Use column view in all Finder windows by default (`icnv`, `clmv`, `Flwv`, `Nlsv`)
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Finder: expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

# Use AirDrop over every interface. Srsly this should be a default.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Save to disk (not to iCloud) by default
defaults write -globalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Disable the warning before removing item from iCloud
defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false

# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Remove the spring loading delay for directories
defaults write NSGlobalDomain com.apple.springing.delay -float 0

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Show item info near icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

# Show item info to the right of the icons on the desktop
/usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom false" ~/Library/Preferences/com.apple.finder.plist

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Increase grid spacing for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist

# Increase the size of icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist

###############################################################################
# Screen                                                                      #
###############################################################################

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Enable subpixel font rendering on non-Apple LCDs
# Reference: https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
defaults write NSGlobalDomain AppleFontSmoothing -int 1

# Enable HiDPI display modes (requires restart)
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true
