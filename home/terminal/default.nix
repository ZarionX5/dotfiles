{
  config,
  inputs,
  ...
}: {
  imports = [
    ./programs
    ./shell/starship.nix
    ./shell/zsh.nix
  ];
  home.sessionVariables = {
    LESSHISTFILE = "${config.xdg.cacheHome}/less/history";
    LESKEY = "${config.xdg.configHome}/less/lesskey";
    # XAUTHORITY = "${config.xdg.runtimeDir}/Xauthority";

    EDITOR = "code";
    DIRENV_LOG_FORMAT = "";

    NIX_AUTO_RUN = "1";
    NIXPKGS_ALLOW_UNFREE = "1";
  };
}
