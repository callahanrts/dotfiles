#
# Cookbook Name:: dotfiles
# Recipe:: chunkwm
#
# Copyright (c) 2018 The Authors, All Rights Reserved.

bash 'install_chunkwm' do
  code <<-EOF
    brew tap crisidev/homebrew-chunkwm
    brew install chunkwm
  EOF
  not_if { !`brew ls --versions chunkwm`.match('chunkwm').nil? }
end

link "#{node[:home]}/.chunkwm_plugins" do
  to "#{node[:dotfiles]}/dots/.chunkwm_plugins"
end

link "#{node[:home]}/.chunkwmrc" do
  to "#{node[:dotfiles]}/dots/.chunkwmrc"
end
