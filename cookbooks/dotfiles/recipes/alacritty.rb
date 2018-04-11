#
# Cookbook Name:: dotfiles
# Recipe:: alacritty
#
# Copyright (c) 2018 The Authors, All Rights Reserved.

has_rust = !`which rustup`.match('rustup').nil?
if has_rust

  directory "#{node[:dotfiles]}/cache"
  git "#{node[:dotfiles]}/cache/alacritty" do
    repository "https://github.com/jwilm/alacritty"
    action :sync
  end

  bash 'install alacritty' do
    code <<-EOF
      pushd #{node[:dotfiles]}/cache/alacritty
      cargo build --release
      make app
      cp -rf target/release/osx/Alacritty.app /Applications/
      popd
    EOF
  end

  # Symlink alacritty configs
  link "#{node[:home]}/.config/alacritty" do
    to "#{node[:dotfiles]}/dots/alacritty"
  end
else
  log "Rustup Missing" do
    message "Rust is not installed. Install rustup and try again."
    level :error
  end
end

