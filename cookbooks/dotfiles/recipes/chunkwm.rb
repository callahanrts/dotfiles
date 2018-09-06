#
# Cookbook Name:: dotfiles
# Recipe:: chunkwm
#
# Copyright (c) 2018 The Authors, All Rights Reserved.

execute "install_chunkwm" do
  cwd "#{node[:home]}"
  user node[:user]
  action :run
  environment ({'HOME' => "#{node[:home]}", 'USER' => node[:user]})
  command "brew tap crisidev/homebrew-chunkwm && brew install chunkwm"
  not_if { !`su #{node[:user]} -l -c 'brew ls --versions chunkwm'`.match('chunkwm').nil? }
end

# TODO: Compile plugins
link "#{node[:home]}/.chunkwm_plugins" do
  to "#{node[:dotfiles]}/dots/.chunkwm_plugins"
end

link "#{node[:home]}/.chunkwmrc" do
  to "#{node[:dotfiles]}/dots/.chunkwmrc"
end
