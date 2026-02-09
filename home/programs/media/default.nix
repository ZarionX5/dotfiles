{ pkgs, ... }:
{
  imports = [
    # ./mpv.nix
  ];

  home.packages = with pkgs; [
    helvum

    amberol

    loupe

    celluloid

    transmission_4-gtk
  ];
}