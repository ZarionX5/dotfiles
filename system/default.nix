let
  desktop = [
    ./core
    ./core/boot.nix

    ./hardware/fwupd.nix
    ./hardware/graphics.nix

    ./network

    ./programs

    ./services
    ./services/pipewire.nix
  ];

  laptop = desktop ++ [
    ./hardware/bluetooth.nix

    ./services/backlight.nix
    ./services/power.nix
  ];
in
{
  inherit desktop laptop;
}