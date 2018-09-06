#
# Cookbook Name:: vim
# Recipe:: default
#
# Copyright (c) 2018 The Authors, All Rights Reserved.

# TODO: Install ripgrep, the_silver_searcher

config_dir = "#{node[:home]}/.config"

bash "Install neovim" do
  code "su codycallahan -l -c 'brew install neovim'"
  not_if { !`su codycallahan -l -c 'brew ls --versions neovim'`.match('neovim').nil? }
end

# TODO: Make sure ~/.config exists

git "#{config_dir}/nvim" do
  repository "https://github.com/callahanrts/vim-config"
  revision 'master'
  checkout_branch 'master'
  enable_checkout false
  user node[:user]
  action :sync
end

# Change git remote to my preference of:
#   github  git@github.com:callahanrts/vim-config (fetch)
#   github  git@github.com:callahanrts/vim-config (push)
bash "switch to ssh repo uri" do
  code <<-EOL
    pushd #{config_dir}/nvim
    git remote rename origin github
    git remote set-url github git@github.com:callahanrts/vim-config
    popd
  EOL
  not_if { !`pushd #{config_dir}/nvim && git branch; popd`.match("master").nil? }
end
