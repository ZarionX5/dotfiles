{vars, ...}: {
  environment.variables.NH_FLAKE = "/home/${vars.username}/.dotfiles";
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 45d";
    };
  };
}