# Config
cask_args appdir: '/Applications'


# Add repositories
tap 'homebrew/services'
tap 'homebrew/cask'

tap 'railwaycat/emacsmacport'
tap 'universal-ctags/universal-ctags'


# Install requirements and dependencies
cask 'java' unless system '/usr/libexec/java_home --failfast'
cask 'xquartz'

brew 'git'
brew 'git-lfs'
brew 'zsh', args: ['without-etcdir']

brew 'dbus', restart_service: true
brew 'texinfo'


# Homebrew packages
brew 'atool'
brew 'cmigemo'
brew 'cscope'
brew 'doxygen'
brew 'editorconfig'
brew 'emacs-mac', args: ['with-dbus', 'with-glib', 'with-imagemagick', 'with-modules', 'with-modern-icon', 'with-natural-title-bar', 'with-xml2']
brew 'exa'
brew 'ffmpeg', args: ['HEAD']
brew 'fd'
brew 'flow'
brew 'git-when-merged'
brew 'gnu-sed', args: ['with-default-names']
brew 'gnu-tar'
brew 'grep', args: ['with-default-names']
brew 'gnupg'
brew 'hunspell'
brew 'jq'
brew 'mas'
brew 'p7zip'
brew 'pandoc'
brew 'peco'
brew 'pinentry-mac'
brew 'plantuml'
brew 'reattach-to-user-namespace'
brew 'rename'
brew 'ripgrep'
brew 'rsync'
brew 'source-highlight'
brew 'ssh-copy-id'
brew 'svn'
brew 'terminal-notifier'
brew 'the_silver_searcher'
brew 'tidy-html5'
brew 'tmux'
brew 'unar'
brew 'universal-ctags', args: ['HEAD']
brew 'wget'

## for Private
brew 'clamav'

## for Worksite
brew 'libiconv'
brew 'gmime'
brew 'xapian'

brew 'isync'
brew 'msmtp'
brew 'mu', args: ['ignore-dependencies', 'HEAD']
brew 'packer'
brew 'putty'


# Homebrew Cask apps
cask 'alfred'
cask 'appcleaner'
cask 'basictex'
cask 'betterzip'
cask 'firefox'
cask 'flash-npapi'
cask 'dash'
cask 'dropbox'
cask 'google-chrome'
cask 'google-backup-and-sync'
cask 'google-japanese-ime'
cask 'iina'
cask 'karabiner-elements'
cask 'makemkv'
cask 'onyx'
cask 'qlcolorcode'
cask 'qlimagesize'
cask 'qlmarkdown'
cask 'qlstephen'
cask 'quicklook-csv'
cask 'quicklook-json'
cask 'suspicious-package'
cask 'yacreader'

## for Worksite
cask 'slack'
cask 'virtualbox'
cask 'virtualbox-extension-pack'
cask 'vagrant'


# Homebrew Cask Fonts
cask 'font-fontawesome'
cask 'font-source-code-pro'
cask 'font-source-han-code-jp'
cask 'font-ricty-diminished'

cask 'font-ipafont'
cask 'font-ipaexfont'