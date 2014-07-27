# -*- mode: ruby; coding: utf-8; indent-tabs-mode: nil -*-


task :link_gitconfig do
  sh "ln -s #{Dir.pwd}/gitconfig ~/.gitconfig"
end

task :link_offlineimap do
  sh "ln -s #{Dir.pwd}/offlineimap ~/.offlineimap"
  sh "ln -s ~/Dropbox/etc/offlineimaprc.worksite ~/.offlineimaprc"
end

task :link_profile do
  sh "ln -s #{Dir.pwd}/profile ~/.profile"
end

task :link_vimrc do
  sh "ln -s #{Dir.pwd}/vimrc ~/.vimrc"
end

task :setup_mac do
  if RUBY_PLATFORM.include?("darwin")
    sh "mkdir ~/bin ~/Code ~/Documents/org ~/lib"
    sh "chflags nohidden ~/Library/"
    sh "defaults write com.apple.finder PathBarRootAtHome -bool true"
    sh "defaults write com.apple.finder QLHidePanelOnDeactivate -bool true"
    sh "defaults write com.apple.finder QLEnableTextSelection -bool true"
    sh "defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true"
    sh "killall Finder"
  end
end

task :default => [:link_gitconfig, :link_profile, :link_vimrc, :setup_mac]
task :setup_for_worksite => [:link_gitconfig, :link_offlineimap, :link_profile, :link_vimrc, :setup_mac]
