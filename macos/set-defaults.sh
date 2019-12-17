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
# osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
# sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
# while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

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

# Close windows when quiting an app
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

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
# defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
# defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

# Keyboard: Set a really fast key repeat.
defaults write -globalDomain KeyRepeat -int 1

# Keyboard: Disable press-and-hold for keys in favor of key repeat.
defaults write -g ApplePressAndHoldEnabled -bool false

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

# Run the screensaver if we're in the bottom-left hot corner.
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

###############################################################################
# Finder                                                                      #
###############################################################################

# New finder window:
# Set Home as the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
# defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
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

# Use AirDrop over every interface. srsly this should be a default.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Save to disk (not to iCloud) by default
defaults write -globalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# TODO: more but this will get me started