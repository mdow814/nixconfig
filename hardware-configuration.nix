# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "ahci" "xhci_pci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/c0adb1b7-4575-4e7e-bb0e-71950bec24fd";
      fsType = "xfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/9D5E-BF85";
      fsType = "vfat";
    };
    
  fileSystems."/home/mdow" =
    { device = "hpool/USERDATA/mdow_3a5x4z";
      fsType = "zfs";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/0bf4fc27-e1d4-49dd-bb10-8ca7e07a595d"; }
    ];

}
