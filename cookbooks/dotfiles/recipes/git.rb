#
# Cookbook Name:: dotfiles
# Recipe:: git
#
# Copyright (c) 2018 The Authors, All Rights Reserved.

# TODO: Don't just link git folder. This should only link the template,
#       gitignores, and hooks. `gitconfig` should no longer be maintained.
#       It's too risky
#
# link "#{node[:home]}/config/git" do
#   to "#{node[:dotfiles]}/config/git"
# end
