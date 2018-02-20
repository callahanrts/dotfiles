#
# Cookbook:: arch
# Recipe:: rofi
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package "rofi"

link "#{node[:home]}/.config/rofi" do
  to "#{node[:dotfiles]}/dots/rofi"
end
