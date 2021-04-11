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
    (import ./modules/desktop.nix { inherit homedir pkgs; })
    ./modules/development.nix
    ./modules/university.nix
    ./modules/gpg.nix
    (import ./modules/git.nix { inherit secrets; })
    ./modules/konsole.nix
    ./modules/sway.nix
    ./modules/zsh.nix
  ];

  nixpkgs.overlays = [ (import ./overlays/discord.nix) ];

  home.username = username;
  home.homeDirectory = homedir;

  home.stateVersion = "21.03";
}
