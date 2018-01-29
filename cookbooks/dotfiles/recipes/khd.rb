#
# Cookbook Name:: dotfiles
# Recipe:: khd
#
# Copyright (c) 2018 The Authors, All Rights Reserved.

bash 'install_khd' do
  code "brew install khd"
  not_if { !`brew ls --versions khd`.match('khd').nil? }
end

link "#{node[:home]}/.khdrc" do
  to "#{node[:dotfiles]}/dots/.khdrc"
end
