{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    feh
    # mailspring
    chromium
    firefox
    teams
    discord
    tdesktop
    bitwarden
    bitwarden-cli
    ncmpcpp
    # libreoffice-fresh
    # onlyoffice https://github.com/icebox-nix/iceberg/blob/adfe05c7e75b68e91438c60540709d98a62d9578/pkgs/office/onlyoffice-bin/default.nix
    deluge
    peek
    audacity
    olive-editor
    obs-studio
    vlc
    kdeconnect
    breeze-icons
    gnome-breeze
  ];

  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark"; # tela, pop, paper, papirus, numix
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "Nordic";
      package = pkgs.nordic;
    };

    font = {
        package = pkgs.roboto;
        name = "Roboto 11";
    };

    gtk3.extraConfig.gtk-cursor-theme-name = "breeze";

  };

  qt = {
    platformTheme = "gtk";
  };

  xresources = {
    properties = {
      "Xft.dpi" = "110";
    };
  };

  programs.chromium = {
    enable = true;
    package = pkgs.chromium;
    extensions = [ 
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
      "nngceckbapebfimnlniiiahkandclblb" # bitwarden
    ];
  };

}
