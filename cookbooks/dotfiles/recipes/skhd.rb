#
# Cookbook Name:: dotfiles
# Recipe:: skhd
#
# Copyright (c) 2018 The Authors, All Rights Reserved.

execute 'install_skhd' do
  cwd "#{node[:home]}"
  user node[:user]
  action :run
  environment ({'HOME' => "#{node[:home]}", 'USER' => node[:user]})
  command "brew install koekeishiya/formulae/skhd"
  not_if { !`su #{node[:user]} -l -c 'brew ls --versions skhd'`.match('skhd').nil? }
end

link "#{node[:home]}/.skhdrc" do
  to "#{node[:dotfiles]}/dots/.skhdrc"
end
