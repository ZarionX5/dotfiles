{ pkgs, ... }:
{
  imports = [
    # ./mpv.nix
  ];

  home.packages = with pkgs; [
    gimp2-with-plugins
    imagemagick

    helvum

    amberol

    loupe

    celluloid

    transmission_4-gtk
  ];
}
