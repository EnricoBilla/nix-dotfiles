{ config, pkgs, stdenv, ... }:

let
  secrets = import ./nixos-secrets.nix;
in
{

  imports =
    [
      ./hardware-configuration.nix
      ./services/ppp.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.supportedFilesystems = [ "ntfs" ];

  networking = {
    hostName = "nixos"; # until i find a better hostname
    nameservers = [ secrets.pihole.ip "8.8.8.8" ];

    # for kde connect
    firewall.allowedTCPPortRanges = [ { from = 1714; to = 1764; } { from =42069; to=42069; } ];
    firewall.allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];

    networkmanager = {
      enable = true;
      dns = "none";
    };
  };

  time.timeZone = "Europe/Rome";
  time.hardwareClockInLocalTime = true;

  services.openvpn.servers = {
    bitcoinpVPN  = { 
      config = secrets.vpn.bitcoinp_config;
      autoStart = false;
      updateResolvConf = true;
    };
    uniVPN  = { 
      config = secrets.vpn.uni_config;
      autoStart = false;
      updateResolvConf = true;
    };
  };

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  services.xserver = {
    enable = true;

    #keyboard
    layout = "it";
    xkbVariant = "us";

    videoDrivers = [ "nvidia" ];

    displayManager = {
      sddm.enable = true;
      sddm.theme = "sugar-candy"; # sugar-candy
      defaultSession = "i3";
            
    };

    desktopManager.gnome3.enable = true;

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
    };

  };

  services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  users.users.enrico = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "networkmanager" "adbusers" ];
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs;
                               let themes = pkgs.callPackage ./sddm-sugar-theme-custom.nix {}; in [

    efibootmgr
    qt5.full # needed for sugar theme
    themes.sddm-sugar-theme-custom
  ];

  environment.pathsToLink = [ "/share/zsh" ];

  programs.gnupg.agent.enable = true;
  virtualisation.docker.enable = true;
  nixpkgs.config.allowUnfree = true;
  services.greenclip.enable = true;
  services.mongodb.enable = true; 
  programs.adb.enable = true;

  services.ppp = {
    enable = true;
    config.isp = {
      interface = "enp42s0";
      username = secrets.pppoe.user;
      password = secrets.pppoe.pass;
      pppoe = true;
      extraOptions = ''
        debug
        noipdefault
        passive
        noauth
        +ipv6
        ipv6cp-use-ipaddr
        hide-password
        defaultroute
        persist
        maxfail 0
        holdoff 5
        lcp-echo-interval 30
        lcp-echo-failure 4
        mtu 1492
        persist
      '';
    };
  };

  system.stateVersion = "20.09";

}
