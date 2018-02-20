#
# Cookbook:: arch
# Recipe:: i3
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package "i3-gaps"

link "#{node[:home]}/.config/i3" do
  to "#{node[:dotfiles]}/dots/i3"
end
