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
  bash "Install #{package.to_s}" do
    code "brew install #{package.to_s}"
    not_if { !`brew ls --versions #{package.to_s}`.match(package.to_s).nil? }
  end
end

