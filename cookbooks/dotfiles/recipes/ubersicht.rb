
directory "#{node[:home]}/Library/Application\ Support/Übersicht/widgets" do
  action :delete
  recursive true
end

link "#{node[:home]}/Library/Application\ Support/Übersicht/widgets" do
  to "#{node[:dotfiles]}/dots/ubersicht/widgets"
end
