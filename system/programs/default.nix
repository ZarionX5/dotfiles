{
  imports = [
    ./fonts.nix
    ./home-manager.nix
    ./xdg.nix
  ];

  programs = {
    dconf.enable = true;
    seahorse.enable = true;
    kdeconnect.enable = true;
    # adb.enable = true;
  };
}