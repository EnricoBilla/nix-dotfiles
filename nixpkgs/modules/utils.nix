{ pkgs, ... }:

{
  home.packages = with pkgs; [
    telnet
    patchelf
    bc
    htop
    gotop
    ffmpeg
    pulseaudio
    pavucontrol
    dnsutils
    exa
    sl
    bat
    fd
    jetbrains-mono
    nano
    zip
    unzip
    file
    konsole
    neofetch
    openssl
  ];

  programs.direnv.enable = true;

  home.sessionVariables = {
    EDITOR = "${pkgs.nano}/bin/nano";
  };
}
