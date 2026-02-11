# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Use the 'latest' box from bento
  config.vm.box = "bento/fedora-latest"

  # Official Vagrant way to resize the primary disk
  config.vm.disk :disk, size: "60GB", primary: true

  # Configuration for Libvirt (KVM)
  config.vm.provider :libvirt do |libvirt|
    libvirt.memory = 8192
    libvirt.cpus = 2
    # VirtioFS requires shared memory backing
    libvirt.memorybacking :access, :mode => "shared"
  end

  # Force virtiofs for the synced folder to avoid NFS/sudo issues
  config.vm.synced_folder ".", "/vagrant", type: "virtiofs"

  # Step 1: System preparation (as root)
  config.vm.provision "shell", inline: <<-SHELL
    # Disk Resizing
    dnf install -y cloud-utils-growpart
    ROOT_DEV=$(findmnt -nvo SOURCE /)
    DISK_DEV=$(echo $ROOT_DEV | sed 's/[0-9]*$//')
    PART_NUM=$(echo $ROOT_DEV | grep -o '[0-9]*$')
    [ -n "$DISK_DEV" ] && [ -n "$PART_NUM" ] && growpart $DISK_DEV $PART_NUM || true
    
    # Resize filesystem (supports Btrfs, XFS and Ext4)
    if mount | grep "on / type btrfs" > /dev/null; then
      btrfs filesystem resize max /
    elif mount | grep "on / type xfs" > /dev/null; then
      xfs_growfs /
    else
      resize2fs $ROOT_DEV || true
    fi

    # Make script executable
    chmod +x /vagrant/kickstart.sh
  SHELL

  # Step 2: Actual setup (as normal user 'vagrant')
  # privileged: false ensures it does NOT run as root.
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    cd /vagrant
    ./kickstart.sh vagrant
  SHELL
end