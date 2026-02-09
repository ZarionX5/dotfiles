{pkgs, inputs, ...}:
{
  home.packages = with pkgs; [
    yazi
  ];
}