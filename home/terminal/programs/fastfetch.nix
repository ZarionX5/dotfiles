{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    fastfetch
  ];
}