directory "#{node[:dotfiles]}/cache"
git "#{node[:dotfiles]}/cache/tmux" do
  repository "https://github.com/gpakosz/.tmux"
  enable_checkout false
  action :sync
end

# Symlink the remote .oh-my-tmux conf file
link "#{node[:home]}/.tmux.conf" do
  to "#{node[:dotfiles]}/cache/tmux/.tmux.conf"
end

link "#{node[:home]}/.tmux.conf.local" do
  to "#{node[:dotfiles]}/dots/.tmux.conf.local"
end

link "#{node[:home]}/.tmuxinator" do
  to "#{node[:dotfiles]}/dots/.tmuxinator"
end
