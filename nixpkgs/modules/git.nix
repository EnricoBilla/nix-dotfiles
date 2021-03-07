{ secrets, ... }:

{
  programs.git = {
    enable = true;
    userName = "Enrico Brambilla";
    userEmail = secrets.github.email;
    signing = {
      key = secrets.github.email;
      signByDefault = true;
    };
    ignores = [ "*.iml" ".idea/" ".vscode" ];
    lfs.enable = true;
  };
}
