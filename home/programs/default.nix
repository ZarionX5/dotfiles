{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
    ./browsers/google-chrome.nix
    ./editors
    ./media
    ./office
    ./gtk.nix
    ./qt.nix
    ./wayland
  ];

  home.packages = with pkgs; [
    telegram-desktop
    gnome-boxes
    nixos-icons

    dconf-editor
    file-roller
    gnome-calculator
    gnome-control-center
    gnome-text-editor
    nautilus
    (papers.override {supportNautilus = true;})

    openvpn
    zeal
  ];

  services.flatpak = {
    # remotes = lib.mkOptionDefault [{
    #   name = "flathub";
    #   location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    # }];
    update.auto.enable = false;
    uninstallUnmanaged = false;

    packages = [
      "dev.ters.LocalTranslate"
    ];
  };
}