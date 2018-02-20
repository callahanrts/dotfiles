#
# Cookbook:: arch
# Recipe:: zsh
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package "zsh"

bash "Change default shell" do
  code "usermod -s $(which zsh) cody"
end

git "#{node[:home]}/.oh-my-zsh" do
  repository "https://github.com/robbyrussell/oh-my-zsh.git"
end

link "#{node[:home]}/.zsh" do
  to "#{node[:dotfiles]}/dots/.zsh"
end

link "#{node[:home]}/.zshrc" do
  to "#{node[:dotfiles]}/dots/.zshrc.arch"
end

directory "#{node[:home]}/.oh-my-zsh/custom/themes"
link "#{node[:home]}/.oh-my-zsh/custom/themes/avit-custom.zsh-theme" do
  to "#{node[:dotfiles]}/dots/.zsh/theme/avit-custom.zsh-theme"
end
