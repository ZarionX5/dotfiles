{
  lib,
  pkgs,
  ...
}: {
  services = {
    printing = {
      enable = true;
      drivers = [
        # pkgs.gutenprint-bin 
        pkgs.canon-cups-ufr2
      ];
    };

    irqbalance.enable = true;
    thermald.enable = true;
    speechd.enable = lib.mkForce false;
  };

  powerManagement = {
    enable = true;
    cpuFreqGovernor = "schedutil";
    powerDownCommands = ''
      loginctl lock-sessions

      sleep 3
    '';
  };
}