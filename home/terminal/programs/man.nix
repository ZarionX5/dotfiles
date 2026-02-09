{ pkgs, ... }:{
  home.packages = with pkgs; [
    man
    man-pages
  ];

  manual.manpages.enable = true;
}