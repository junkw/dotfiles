# -*- mode: ruby; coding: utf-8; indent-tabs-mode: nil -*-
require 'fileutils'



task :link_gitconfig do
  FileUtils.ln_sf("#{Dir.pwd}/gitconfig", "#{Dir.home}/.gitconfig")
end

task :link_offlineimap do
  FileUtils.ln_sf("#{Dir.pwd}/offlineimap", "#{Dir.home}/.offlineimap")
  FileUtils.ln_sf("#{Dir.home}/Dropbox/etc/offlineimaprc.worksite", "#{Dir.home}/.offlineimaprc")
end

task :link_zshrc do
  FileUtils.ln_sf("#{Dir.pwd}/zlogin", "#{Dir.home}/.zlogin")
  FileUtils.ln_sf("#{Dir.pwd}/zpreztorc", "#{Dir.home}/.zpreztorc")
  FileUtils.ln_sf("#{Dir.pwd}/zshenv", "#{Dir.home}/.zshenv")
  FileUtils.ln_sf("#{Dir.pwd}/zshrc", "#{Dir.home}/.zshrc")
end

task :link_vimrc do
  FileUtils.ln_sf("#{Dir.pwd}/vimrc", "#{Dir.home}/.vimrc")
end

task :clone_antigen do
  sh "git clone https://github.com/zsh-users/antigen.git #{Dir.home}/.zantigen"
end

task :clone_prezto do
  sh "git clone --recursive https://github.com/sorin-ionescu/prezto.git #{Dir.home}/.zprezto"
end

task :update_hunspell_dict do
  dictionary_path = "#{Dir.home}/Library/Spelling"

  sh "curl -sfL http://cgit.freedesktop.org/libreoffice/dictionaries/plain/en/en_US.aff -o #{dictionary_path}/en_US.aff"
  sh "curl -sfL http://cgit.freedesktop.org/libreoffice/dictionaries/plain/en/en_US.dic -o #{dictionary_path}/en_US.dic"
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

task :default => [:link_gitconfig,
                  :clone_prezto,
                  :clone_antigen,
                  :link_zshrc,
                  :link_vimrc,
                  :update_hunspell_dict,
                  :setup_mac]
