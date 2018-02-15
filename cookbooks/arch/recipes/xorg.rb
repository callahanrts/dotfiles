#
# Cookbook:: arch
# Recipe:: xorg
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package "xorg-server"
package "xorg-xinit"
package "xorg-xrandr"

link "#{node[:home]}/.xinitrc" do
  to "#{node[:dotfiles]}/dots/.xinitrc"
end
