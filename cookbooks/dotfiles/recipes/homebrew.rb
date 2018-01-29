#
# Cookbook Name:: dotfiles
# Recipe:: homebrew
#
# Copyright (c) 2018 The Authors, All Rights Reserved.

bash 'install_homebrew' do
  code <<-EOL
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  EOL
  not_if { !`which brew`.match('brew').nil? }
end
