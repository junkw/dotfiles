# Config
cask_args appdir: '/Applications'

# Add repositories
tap 'homebrew/services'

tap 'caskroom/cask'
tap 'caskroom/homebrew-versions'
tap 'caskroom/fonts'

tap 'railwaycat/emacsmacport'
tap 'universal-ctags/universal-ctags'

# Install requirements and dependencies packages
cask 'java' unless system '/usr/libexec/java_home --failfast'
cask 'xquartz'

brew 'git'
brew 'git-lfs'
brew 'zsh', args: ['without-etcdir']

brew 'dbus', restart_service: true
brew 'ffmpeg', args: ['with-fdk-aac', 'with-openh264', 'with-x265', 'with-libbluray', 'HEAD']
brew 'texinfo'

# Homebrew packages
brew 'atool'
brew 'cmigemo'
brew 'cscope'
brew 'doxygen'
brew 'editorconfig'
brew 'emacs-mac', args: ['with-dbus', 'with-glib', 'with-gnutls', 'with-imagemagick', 'with-modules', 'with-official-icon', 'with-xml2']
brew 'exa'
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
brew 'mpv', args: ['with-bundle', 'with-libaacs', 'with-libbluray', 'with-libdvdnav', 'with-libdvdread', 'HEAD']
brew 'p7zip'
brew 'packer'
brew 'pandoc'
brew 'peco'
brew 'pinentry-mac'
brew 'plantuml'
brew 'putty'
brew 'reattach-to-user-namespace'
brew 'rename'
brew 'ripgrep'
brew 'rsync'
brew 'source-highlight'
brew 'ssh-copy-id'
brew 'svn'
brew 'terminal-notifier'
brew 'the_silver_searcher'
brew 'tmux'
brew 'unar'
brew 'universal-ctags', args: ['HEAD']
brew 'wget'

brew 'isync'
brew 'msmtp'
brew 'mu', args: ['with-emacs', 'HEAD']

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
cask 'karabiner-elements'
cask 'makemkv'
cask 'onyx'
cask 'qlcolorcode'
cask 'qlimagesize'
cask 'qlmarkdown'
cask 'qlstephen'
cask 'quicklook-csv'
cask 'quicklook-json'
cask 'slack'
cask 'silverlight'
cask 'suspicious-package'

cask 'virtualbox'
cask 'virtualbox-extension-pack'
cask 'vagrant'

# Homebrew Cask Fonts
cask 'font-ricty-diminished'
cask 'font-fontawesome'
