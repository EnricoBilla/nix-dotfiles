{ pkgs, ... }:

{
  home.packages = with pkgs; [
    alacritty
    nerdfonts
    #libsixel #not secure
  ];

 xdg.configFile."alacritty/alacritty.yml".source = ../configs/alacritty/alacritty.yml;

}
