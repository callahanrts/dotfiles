#
# Cookbook Name:: dotfiles
# Recipe:: zsh
#
# Copyright (c) 2018 The Authors, All Rights Reserved.

bash 'install_zsh' do
  code <<-EOF
    brew install zsh
  EOF
  not_if { !`brew ls --versions zsh`.match('zsh').nil? }
end


bash 'install_oh_my_zsh' do
  code <<-EOF
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    mkdir -p #{node[:home]}/.oh-my-zsh/custom/themes
  EOF
  not_if { File.directory?("#{node[:home]}/.oh-my-zsh") }
end

log 'message' do
  message 'NOTE: You will need to run "chsh -s /bin/zsh" to change your shell'
  level :info
end

# Symlink my custom zsh theme
link "#{node[:home]}/.oh-my-zsh/custom/themes/avit-custom.zsh-theme" do
  to "#{node[:dotfiles]}/dots/.zsh/theme/avit-custom.zsh-theme"
end

# Symlink my .zshrc
link "#{node[:home]}/.zshrc" do
  to "#{node[:dotfiles]}/dots/.zshrc"
end

# Symlink my .zsh directory
link "#{node[:home]}/.zsh" do
  to "#{node[:dotfiles]}/dots/.zsh"
end
