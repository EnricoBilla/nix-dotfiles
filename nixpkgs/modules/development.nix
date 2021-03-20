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
    gcc
    gnumake
    cmake
    jetbrains.idea-ultimate
    jetbrains.clion
    jetbrains.pycharm-professional
    jetbrains.webstorm
    openjdk11
    python
    python3
  ];

  programs.vscode.enable = true;

}
