# -*- mode: ruby; coding: utf-8; indent-tabs-mode: nil -*-
require 'fileutils'



task :link_aspellconf do
  FileUtils.ln_sf("#{Dir.pwd}/aspell.conf" "#{Dir.home}/.aspell.conf")
end

task :link_gitconfig do
  FileUtils.ln_sf("#{Dir.pwd}/gitconfig" "#{Dir.home}/.gitconfig")
end

task :link_offlineimap do
  FileUtils.ln_sf("#{Dir.pwd}/offlineimap" "#{Dir.home}/.offlineimap")
  FileUtils.ln_sf("#{Dir.home}/Dropbox/etc/offlineimaprc.worksite" "#{Dir.home}/.offlineimaprc")
end

task :link_profile do
  FileUtils.ln_sf("#{Dir.pwd}/profile" "#{Dir.home}/.profile")
end

task :link_vimrc do
  FileUtils.ln_sf("#{Dir.pwd}/vimrc" "#{Dir.home}/.vimrc")
end

task :setup_mac do
  if RUBY_PLATFORM.include?("darwin")
    FileUtils.mkdir_p("#{Dir.home}/bin")
    FileUtils.mkdir_p("#{Dir.home}/Code")
    FileUtils.mkdir_p("#{Dir.home}/Documents/org")
    FileUtils.mkdir_p("#{Dir.home}/lib")
    sh "chflags nohidden ~/Library/"
    sh "defaults write com.apple.finder PathBarRootAtHome -bool true"
    sh "defaults write com.apple.finder QLHidePanelOnDeactivate -bool true"
    sh "defaults write com.apple.finder QLEnableTextSelection -bool true"
    sh "defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true"
    sh "killall Finder"
  end
end

task :default => [:link_aspellconf, :link_gitconfig, :link_profile, :link_vimrc, :setup_mac]
