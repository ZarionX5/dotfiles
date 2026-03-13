{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libreoffice
    obsidian
    textsnatcher
    xournalpp
  ];
}