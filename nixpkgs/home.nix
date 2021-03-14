{ config, pkgs, ... }:
let
  username = builtins.getEnv "USER";
  homedir = builtins.getEnv "HOME";
  secrets = import ./hm-secrets.nix;
in
{
  programs.home-manager = {
    enable = true;
    path = "https://github.com/nix-community/home-manager/archive/release-20.09.tar.gz";
  };


  imports = [
    ./modules/utils.nix
    ./modules/desktop.nix
    ./modules/development.nix
    ./modules/university.nix
    ./modules/gpg.nix
    (import ./modules/git.nix { secrets = secrets; })
    ./modules/konsole.nix
    ./modules/zsh.nix
  ];

  home.username = username;
  home.homeDirectory = homedir;

  home.stateVersion = "21.03";
}
