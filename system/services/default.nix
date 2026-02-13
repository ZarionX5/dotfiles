{
  lib,
  pkgs,
  ...
}: {
  services = {
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
