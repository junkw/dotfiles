# -*- mode: ruby; coding: utf-8; indent-tabs-mode: nil -*-
require 'fileutils'



task :make_dir do
  home_dirs = ["#{Dir.home}/.cache/vim",
               "#{Dir.home}/.local/share",
               "#{Dir.home}/bin",
               "#{Dir.home}/Code",
               "#{Dir.home}/Documents/org",
               "#{Dir.home}/lib"]
  FileUtils.mkdir_p(home_dirs)
end

task :link_bin do
  bin = Dir.glob("#{Dir.pwd}/bin/*")
  FileUtils.ln_sf(bin, "#{Dir.home}/bin/")
end

task :link_xdg_config_home do
  FileUtils.ln_sf("#{Dir.pwd}/config", "#{Dir.home}/.config")
end

task :link_vimrc do
  FileUtils.ln_sf("#{Dir.pwd}/vimrc", "#{Dir.home}/.vimrc")
end

task :link_zshrc do
  FileUtils.ln_sf("#{Dir.pwd}/zlogin", "#{Dir.home}/.zlogin")
  FileUtils.ln_sf("#{Dir.pwd}/zpreztorc", "#{Dir.home}/.zpreztorc")
  FileUtils.ln_sf("#{Dir.pwd}/zprofile", "#{Dir.home}/.zprofile")
  FileUtils.ln_sf("#{Dir.pwd}/zshenv", "#{Dir.home}/.zshenv")
  FileUtils.ln_sf("#{Dir.pwd}/zshrc", "#{Dir.home}/.zshrc")
end

task :clone_antigen do
  sh "git clone https://github.com/zsh-users/antigen.git #{Dir.home}/.zantigen"
end

task :clone_prezto do
  sh "git clone --recursive https://github.com/sorin-ionescu/prezto.git #{Dir.home}/.zprezto"
end

task :copy_offlineimap_config do
  FileUtils.cp("#{Dir.pwd}/config/offlineimap/config-dist", "#{Dir.home}/.config/offlineimap/config")

  mailaddress = ENV['GMAIL']
  sh "sed -i '' -e 's/__GMAIL__/#{mailaddress}/g' #{Dir.home}/.config/offlineimap/config"
end

task :install_hunspell_dicts do
  sh "#{Dir.pwd}/bin/hunspell_update_dicts"
end

task :set_mac_config do
  if RUBY_PLATFORM.include?("darwin")
    sh "chflags nohidden ~/Library/"
    sh "defaults write com.apple.finder PathBarRootAtHome -bool true"
    sh "defaults write com.apple.finder QLHidePanelOnDeactivate -bool true"
    sh "defaults write com.apple.finder QLEnableTextSelection -bool true"
    sh "defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true"
    sh "killall Finder"
  end
end

task :install_zshplugins => [:clone_prezto, :clone_antigen]
task :link => [:link_bin, :link_xdg_config_home, :link_vimrc, :link_zshrc]
task :install => [:make_dir, :link, :copy_offlineimap_config, :install_zshplugins, :install_hunspell_dicts]
task :default => [:install, :set_mac_config]
