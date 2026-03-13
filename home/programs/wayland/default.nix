{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wtype
    wl-clipboard
  ];

  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland;xcb";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    NIXOS_OZONE_WL = "1";
  };

  systemd.user.targets.tray.Unit.Requires = [ "graphical-session.target" ];
}
