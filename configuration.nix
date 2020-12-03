{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = [ 
    "kvm-amd" 
    "vfio"
    "vfio_iommu_type1"
    "vfio-pci" 
  ];
  boot.kernelParams = [ 
    "amd_iommu=on"
    "vfio-pci.ids=1002:67df,1002:aaf0"
    "kvm.ignore_msrs=1"
  ]; 
  virtualisation.libvirtd.enable = true;
 
  time.timeZone = "EST5EDT";
  
  networking.hostName = "ni14ae"; 
  networking.useDHCP = false;
  networking.interfaces.enp39s0 = {
    useDHCP = false;
    ipv4.addresses = [ {
      address = "192.168.1.5";
      prefixLength = 24;
    } ];
  };
  networking.defaultGateway = "192.168.1.1";
  networking.nameservers = [ "1.1.1.1" ];
  networking.hostId = "854260d3";
  networking.firewall.allowedTCPPorts = [ 22 24800 ];
  
  i18n.defaultLocale = "en_US.UTF-8";
  
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;
  services.xserver.layout = "us";
  services.bamf.enable = true;
  services.openssh.enable = true; 

  sound.enable = true;
  hardware.pulseaudio.enable = true;
  
  users.users.mdow = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" ]; # Enable ‘sudo’ for the user.
  };
  
  # needed for steam/chrome
  nixpkgs.config.allowUnfree = true;
  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
  hardware.pulseaudio.support32Bit = true;
  
  environment.systemPackages = with pkgs; [
    wget 
    vim 
    htop 
    git
    firefox 
    google-chrome
    xfce.xfce4-whiskermenu-plugin 
    arc-theme
    steam 
    virt-manager
    plank
    vscode
    barrier
    papirus-icon-theme
    gnome3.file-roller
    neofetch
    gnome3.adwaita-icon-theme
    hicolor-icon-theme
  ];
  
  system.stateVersion = "unstable";

}

