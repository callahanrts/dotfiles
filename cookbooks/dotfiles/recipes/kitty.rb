#
# Cookbook Name:: dotfiles
# Recipe:: kitty
#
# Copyright (c) 2018 The Authors, All Rights Reserved.


# Symlink alacritty configs
link "#{node[:home]}/.config/kitty" do
  to "#{node[:dotfiles]}/dots/kitty"
end

