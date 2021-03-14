{ pkgs, ... }:

{
  home.packages = with pkgs; [
    konsole
  ];

  xdg.dataFile."konsole/Nordic.colorscheme".source = ../configs/konsole/Nordic.colorscheme;
  xdg.dataFile."konsole/Profile 1.profile".source = ../configs/konsole/Profile.profile;
}
