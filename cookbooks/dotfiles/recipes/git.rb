#
# Cookbook Name:: dotfiles
# Recipe:: git
#
# Copyright (c) 2018 The Authors, All Rights Reserved.

link "#{node[:home]}/config/git" do
  to "#{node[:dotfiles]}/config/git"
end
