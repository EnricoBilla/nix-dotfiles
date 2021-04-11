{ pkgs, ... }:

{
  xdg.configFile."sway/config".source = ../configs/sway/config;
}
