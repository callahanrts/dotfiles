#
# Cookbook:: arch
# Recipe:: termite
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package "termite"

directory "#{node[:dotfiles]}/cache"
git "#{node[:dotfiles]}/cache/termite" do
  repository "https://github.com/1se/onedark-termite"
end

directory "#{node[:home]}/.config/termite"
link "#{node[:home]}/.config/termite/config" do
  to "#{node[:dotfiles]}/cache/termite/onedark.colors"
end
