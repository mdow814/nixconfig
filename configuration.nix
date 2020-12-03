{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "ni14ae"; 
  time.timeZone = "EST5EDT";
  networking.useDHCP = false;
  networking.interfaces.enp39s0.useDHCP = true;
  networking.interfaces.enp49s0f3u1u3.useDHCP = true;
  networking.hostId = "854260d3";
  i18n.defaultLocale = "en_US.UTF-8";
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;
  services.xserver.layout = "us";
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  users.users.mdow = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };
  nixpkgs.config.allowUnfree = true;
  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
  hardware.pulseaudio.support32Bit = true;
  environment.systemPackages = with pkgs; [
    wget vim htop git
    firefox google-chrome
    xfce.xfce4-whiskermenu-plugin 
    arc-theme
    steam virt-manager 
  ];
  services.openssh.enable = true;
  system.stateVersion = "unstable"; # Did you read the comment?

}

