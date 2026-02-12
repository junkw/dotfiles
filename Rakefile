# -*- mode: ruby; coding: utf-8; indent-tabs-mode: nil -*-

require 'fileutils'


task :make_dir do
  home_dirs = ["#{Dir.home}/.cache/enhancd/",
               "#{Dir.home}/.cache/vim/backup",
               "#{Dir.home}/.cache/vim/undo",
               "#{Dir.home}/.cache/vim/swap",
               "#{Dir.home}/.local/share",
               "#{Dir.home}/bin",
               "#{Dir.home}/Code",
               "#{Dir.home}/Documents/org",
               "#{Dir.home}/opt"]
  FileUtils.mkdir_p(home_dirs)
end

task :link_bin do
  bin = Dir.glob("#{Dir.pwd}/bin/*")
  FileUtils.ln_sf(bin, "#{Dir.home}/bin/")
end

task :link_ctags do
  FileUtils.ln_sf("#{Dir.pwd}/ctags", "#{Dir.home}/.ctags")
end

task :link_launch_agents do
  usr_launch_agents_path = "#{Dir.home}/Library/LaunchAgents/"

  FileUtils.mkdir_p(usr_launch_agents_path)
  FileUtils.ln_sf("#{Dir.pwd}/Library/LaunchAgents/junkw.xdg.environments.plist", "#{usr_launch_agents_path}")
end

task :link_textlintrc do
  FileUtils.ln_sf("#{Dir.pwd}/textlintrc", "#{Dir.home}/.textlintrc")
end

task :link_vimrc do
  FileUtils.ln_sf("#{Dir.pwd}/vimrc", "#{Dir.home}/.vimrc")
end

task :link_xdg_config_home do
  FileUtils.ln_sf("#{Dir.pwd}/config", "#{Dir.home}/.config")
end

task :link_zshrc do
  FileUtils.ln_sf("#{Dir.pwd}/zlogin", "#{Dir.home}/.zlogin")
  FileUtils.ln_sf("#{Dir.pwd}/zpreztorc", "#{Dir.home}/.zpreztorc")
  FileUtils.ln_sf("#{Dir.pwd}/zshenv", "#{Dir.home}/.zshenv")
  FileUtils.ln_sf("#{Dir.pwd}/zshrc", "#{Dir.home}/.zshrc")
end

task :clone_tmux_colors_solarized do
  sh "git clone https://github.com/seebi/tmux-colors-solarized.git #{Dir.home}/opt/tmux-colors-solarized"
end

task :install_hunspell_dicts do
  sh "#{Dir.pwd}/bin/hunspell_update_dicts"
end

task :load_launch_agents do
  sh("launchctl load #{Dir.home}/Library/LaunchAgents/junkw.xdg.environments.plist")
end

task :set_macos_config do
  if RUBY_PLATFORM.include?("darwin")
    sh "chflags nohidden ~/Library/"
    sh "defaults write com.apple.finder PathBarRootAtHome -bool true"
    sh "defaults write com.apple.finder QLHidePanelOnDeactivate -bool true"
    sh "defaults write com.apple.finder QLEnableTextSelection -bool true"
    sh "defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true"
    sh "killall Finder"
  end
end

task :set_mbsync_config do
  mailaddress = ENV['GMAIL']
  mail_dir    = "#{Dir.home}/.local/share/mail"
  config_file = ".config/mbsync/config"

  FileUtils.mkdir_p(mail_dir)
  FileUtils.cp("#{Dir.pwd}/config/mbsync/config-dist", "#{Dir.home}/#{config_file}")
  sh "/usr/bin/sed -i '' -e 's/__GMAIL__/#{mailaddress}/g' #{Dir.home}/#{config_file}"
end

task :link => [:link_bin, :link_xdg_config_home, :link_ctags, :link_textlintrc, :link_vimrc, :link_zshrc]
task :install => [:make_dir, :link, :install_hunspell_dicts]
task :setup_mac => [:link_launch_agents, :load_launch_agents, :set_macos_config]
task :default => [:install, :setup_mac]
task :after => [:set_mbsync_config]
