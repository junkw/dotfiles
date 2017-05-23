# Config
cask_args appdir: '/Applications'

# Add repositories
tap 'homebrew/dupes'
tap 'homebrew/services'
tap 'homebrew/versions'

tap 'homebrew/homebrew-php'

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

# Homebrew packages
brew 'atool'
brew 'cmigemo'
brew 'cscope'
brew 'doxygen'
brew 'emacs-mac', args: ['with-dbus', 'with-glib', 'with-gnutls', 'with-imagemagick', 'with-official-icon', 'with-xml2']
brew 'flow'
brew 'gnu-sed', args: ['with-default-names']
brew 'gnu-tar'
brew 'grep', args: ['with-default-names']
brew 'gnupg'
brew 'hunspell'
brew 'jq'
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
brew 'texinfo'
brew 'the_silver_searcher'
brew 'tmux'
brew 'unar'
brew 'universal-ctags', args: ['HEAD']
brew 'wget'

brew 'isync'
brew 'msmtp'
brew 'mu', args: ['with-emacs', 'HEAD']

brew 'php71'
brew 'php-code-sniffer'
brew 'php-cs-fixer'
brew 'phpctags'
brew 'phpmd'

# Homebrew Cask apps
cask 'alfred'
cask 'appcleaner'
cask 'basictex'
cask 'betterzip'
cask 'cmd-eikana'
cask 'firefox'
cask 'flash-npapi'
cask 'dash'
cask 'dropbox'
cask 'google-chrome'
cask 'google-drive'
cask 'google-japanese-ime'
cask 'onyx'
cask 'qlcolorcode'
cask 'qlimagesize'
cask 'qlmarkdown'
cask 'qlstephen'
cask 'quicklook-csv'
cask 'quicklook-json'
cask 'silverlight'
cask 'suspicious-package'

cask 'virtualbox'
cask 'virtualbox-extension-pack'
cask 'vagrant'

# Homebrew Cask Fonts
cask 'font-ricty-diminished'
