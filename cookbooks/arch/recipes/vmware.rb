#
# Cookbook:: arch
# Recipe:: vmware
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#


package "net-tools"
package "linux-headers"

bash "Mount and Install VMWare Tools CDRom" do
  code <<-EOF
    # Create bogus directories for the install er
    for x in {0..6} ; do mkdir -p /etc/init.d/rc.${x}.d; done

    # Mount the CDROM
    mount /dev/cdrom /mnt
  EOF
  not_if{ !Dir.glob("/mnt/VMwareTools*").empty? }
end


bash "Install VMware Tools" do
  code <<-EOF
    # Extract to /root
    tar xf /mnt/VMwareTools*.tar.gz -C /root

    # Start VMWare Tools
    perl /root/vmware-tools-distrib/vmware-install.pl

    # Unmount the
    umount /mnt
  EOF
  # not_if{ !File.exists?("/root/vmware-tools-distrib/vmware-install.pl") }
end



# OPEN VM TOOLS
# package "open-vm-tools"
# package "gtkmm3"
# package "gtk2"
#
# service "vmtoolsd" do
#   action :enable
# end
#
# service "vmware-vmblock-fuse" do
#   action :enable
# end
#
# bash "Copy Version" do
#   code "cat /proc/version > /etc/arch-release"
# end
#
# #file "/etc/xdg/autostart/vmware-user.desktop" do
# file "/usr/share/applications/vmware-user.desktop" do
#   content <<-EOF
# [Desktop Entry]
# Type=Application
# Name=VMWare User Agent
# Exec=/usr/bin/vmware-user-suid-wrapper
# Icon=system-run
# Comment=Enable Unity, DnD, etc.
#   EOF
# end
# # file "/etc/mkinitcpio.conf" do
# #   content 'MODULES="vsock vmw_vsock_vmci_transport vmw_baloon vmw_vmci vmwgfx"'
# # end
