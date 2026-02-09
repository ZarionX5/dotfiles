{
  pkgs,
  inputs,
  ...
}:
{
  # home.packages = with pkgs; [
  #   protonup-qt

  #   gamescope
  #   # prismlauncher
  #   winetricks
  #   protontricks
  #   vulkan-loader
  #   vulkan-tools
  # ];

  services.flatpak.packages = [
    "ru.linux_gaming.PortProton"
  ];
}