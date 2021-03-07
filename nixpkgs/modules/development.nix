{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nodejs
    yarn
    httpie
    insomnia
    asciinema
    jq
    wget
    jetbrains.idea-ultimate
    jetbrains.pycharm-professional
    jetbrains.webstorm
    openjdk11
  ];

  programs.vscode.enable = true;

}
