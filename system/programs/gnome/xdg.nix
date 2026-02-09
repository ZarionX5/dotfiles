{ pkgs, ... }: {
  xdg.portal = {
    config.gnome.default = [
      "gnome"
      "gtk"
    ];
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
  };
}