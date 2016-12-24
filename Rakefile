# -*- mode: ruby; coding: utf-8; indent-tabs-mode: nil -*-
require 'fileutils'



task :make_dir do
  home_dirs = ["#{Dir.home}/.cache/enhancd/",
               "#{Dir.home}/.cache/vim/backup",
               "#{Dir.home}/.cache/vim/undo",
               "#{Dir.home}/.cache/vim/swap",
               "#{Dir.home}/.local/share",
               "#{Dir.home}/.local/share/gmail",
               "#{Dir.home}/bin",
               "#{Dir.home}/Code",
               "#{Dir.home}/Documents/org",
               "#{Dir.home}/lib",
               "#{Dir.home}/opt"]
  FileUtils.mkdir_p(home_dirs)
end

task :link_bin do
  bin = Dir.glob("#{Dir.pwd}/bin/*")
  FileUtils.ln_sf(bin, "#{Dir.home}/bin/")
end

task :link_launch_agents do
  usr_launch_agents_path = "#{Dir.home}/Library/LaunchAgents/"

  FileUtils.mkdir_p(usr_launch_agents_path)
  FileUtils.ln_sf("#{Dir.pwd}/Library/LaunchAgents/junkw.xdg.environments.plist", "#{usr_launch_agents_path}")
end

task :load_launch_agents do
  sh("launchctl load #{Dir.home}/Library/LaunchAgents/junkw.xdg.environments.plist")
end

task :load_launch_agents_virtualbox do
  plist = 'org.virtualbox.environments.plist'

  sh("sed -e \"s/__USER__/#{ENV['USER']}/g\" #{Dir.pwd}/Library/LaunchAgents/#{plist} > #{Dir.home}/Library/LaunchAgents/#{plist}")
  sh("launchctl load #{Dir.home}/Library/LaunchAgents/#{plist}")
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

task :clone_tmux_colors_solarized do
  sh "git clone https://github.com/seebi/tmux-colors-solarized.git #{Dir.home}/.local/share/tmux-colors-solarized"
end

task :copy_mbsync_config do
  config_file = ".config/mbsync/config"
  FileUtils.cp("#{Dir.pwd}/config/mbsync/config-dist", "#{Dir.home}/#{config_file}")

  mailaddress = ENV['GMAIL']
  sh "/usr/bin/sed -i '' -e 's/__GMAIL__/#{mailaddress}/g' #{Dir.home}/#{config_file}"
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
    sh "sudo /usr/bin/sed -i.origin -E 's/(^ +SendEnv)/#\1/g' /etc/ssh/ssh_config"
  end
end

task :link => [:link_bin, :link_xdg_config_home, :link_vimrc, :link_zshrc]
task :install => [:make_dir, :link, :copy_mbsync_config, :clone_tmux_colors_solarized, :install_hunspell_dicts]
task :setup_mac => [:link_launch_agents, :load_launch_agents, :set_mac_config]
task :default => [:install, :setup_mac]
