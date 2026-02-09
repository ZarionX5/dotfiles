{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./xdg.nix
    ./dconf.nix
  ];
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  
  environment.gnome.excludePackages = (with pkgs; [
    atomix # puzzle game
    # cheese # webcam tool
    epiphany # web browser
    # evince # document viewer
    geary # email reader
    # gedit # text editor
    # gnome-characters
    gnome-music
    gnome-software
    # gnome-photos
    gnome-console
    gnome-tour
    gnome-user-docs
    showtime
    hitori # sudoku game
    iagno # go game
    tali # poker game
    devhelp
    decibels
  ]);
  environment.systemPackages = with pkgs.gnomeExtensions; [
    appindicator
    dash-to-dock
    clipboard-indicator
    (another-window-session-manager.overrideAttrs (oldAttrs: rec {
      version = "51";
      src = pkgs.fetchFromGitHub {
        owner = "nlpsuge";
        repo = "gnome-shell-extension-another-window-session-manager";
        rev = "${version}";
        sha256 = "sha256-SXs09DqqFBIa/xXwVyT8wBucqHZLXW5ovNVQSudy1KE=";
      };
    }))
  ];
}