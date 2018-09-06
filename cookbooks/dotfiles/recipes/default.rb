#
# Cookbook Name:: dotfiles
# Recipe:: default
#
# Copyright (c) 2018 The Authors, All Rights Reserved.


[
  :exa,
  :rbenv,
  :the_silver_searcher,
  :ripgrep
].each do |package|
  execute "Install #{package.to_s}" do
    user node[:user]
    action :run
    environment ({'HOME' => "#{node[:home]}", 'USER' => node[:user]})
    command "brew install #{package.to_s}"
    not_if { !`su #{node[:user]} -l -c 'brew ls --versions #{package.to_s}'`.match(package.to_s).nil? }
  end
end


# TODO: Hide desktop icons
# defaults write com.apple.finder CreateDesktop false
# killall Finder
