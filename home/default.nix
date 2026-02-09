{
  self,
  inputs,
  vars,
  ...
}:
{
  imports = [
    ./terminal
    inputs.nix-index-db.homeModules.nix-index
  ];

  home = {
    username = "${vars.username}";
    homeDirectory = "/home/${vars.username}";
    stateVersion = "25.11";
  };

  programs.home-manager.enable = true;
}