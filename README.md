# nixos
My NixOS configuration files.

## NixOS simple installation guide.

# Step One: Partition

Partition using cfdisk.

# Step 2: Format

mkfs.ext4 -L nixos /dev/sdX
mkfs.fat -F32 -n boot /dev/sdX

# Step 3: Mount
mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/boot
mount /dev/disk/by-label/boot /mnt/boot

# Step 4: NixOS Configuration

nixos-generate-config --root /mnt
Change to your liking.

nixos-install when finished.

# Step 5: Reboot

It's that fucking simple.

# Additional Information

# How to Update

nix-channel --update
nixos-rebuild switch --upgrade
