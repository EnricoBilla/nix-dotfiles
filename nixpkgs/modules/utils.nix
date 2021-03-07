{ pkgs, ... }:

{
  home.packages = with pkgs; [
    htop
    gotop
    ffmpeg
    pulseaudio
    pavucontrol
    dnsutils
    exa
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
