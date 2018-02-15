#
# Cookbook:: arch
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package "xterm"

# Needed for installing from AUR manually
package "linux-headers"
package "file"
package "xdotool"
package "feh"

#bash "Install exa" do
  #code "yaourt -S exa-git --noconfirm"
#end
