# nixos
My NixOS configuration files. I'm not a full-time NixOS user, but I do hop over to it sometimes so I store my configurations here.

# NixOS simple installation guide.

## Step One: Partition

Partition using cfdisk.

## Step 2: Format

mkfs.ext4 -L nixos /dev/sdX
mkfs.fat -F32 -n boot /dev/sdX

## Step 3: Mount
mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/boot
mount /dev/disk/by-label/boot /mnt/boot

## Step 4: NixOS Configuration

nixos-generate-config --root /mnt
Change to your liking.

nixos-install when finished.

## Step 5: Reboot

It's that fucking simple.

## Additional Information

## How to Update

nix-channel --update
nixos-rebuild switch --upgrade

# Screenshot of my desktop while I was using NixOS

I use dwm most of the time, but in this screenshot I was using BSPWM. I will not release my BSPWM dotfiles.

![Nix](https://github.com/tuxfanboy/nixos/blob/main/nixos-screenshot.png)
