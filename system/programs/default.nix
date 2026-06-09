{
  pkgs,
  ...
}:
{
  imports = [
    ./fonts.nix
    ./home-manager.nix
    ./xdg.nix
  ];

  programs = {
    dconf.enable = true;
    seahorse.enable = true;
    kdeconnect = {
      enable = true;
      package = pkgs.gnomeExtensions.gsconnect;
    };
    # adb.enable = true;
  };
}
