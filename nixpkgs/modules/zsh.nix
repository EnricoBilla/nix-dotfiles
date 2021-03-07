{ pkgs, ... }:

{

  # needed for interactive cd
  programs.fzf.enable = true;

  programs.zsh = {
    enable = true;
    shellAliases = {
      ls="exa -algh --group-directories-first";
      cat="bat --plain";
      isodate = "date -u +'%Y-%m-%dT%H:%M:%SZ'";
      find = "fd";
      cal = "cal -m";
      hm = "home-manager";
      tree = "exa -T";
      bitmoon = "cd ~/Projects/bitmoon-backend";
      matlichess = "cd ~/Projects/matlichess";
      nixdf = "cd ~/Projects/nix-dotfiles";
    };

    enableAutosuggestions = true;
    enableCompletion = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git"
                  "sudo"
                  "python"
                  "man"
                  "pip"
                  "zsh-interactive-cd"
                  "colored-man-pages" ];
      theme = "agnoster";
    };

  };

}
