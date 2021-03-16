{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gurobi
    texstudio
  ];
  
}

