#
# Cookbook Name:: dotfiles
# Recipe:: khd
#
# Copyright (c) 2018 The Authors, All Rights Reserved.

execute 'install_khd' do
  cwd "#{node[:home]}"
  user node[:user]
  action :run
  environment ({'HOME' => "#{node[:home]}", 'USER' => node[:user]})
  command "brew install koekeishiya/formulae/khd"
  not_if { !`su #{node[:user]} -l -c 'brew ls --versions khd'`.match('khd').nil? }
end

link "#{node[:home]}/.khdrc" do
  to "#{node[:dotfiles]}/dots/.khdrc"
end
