{lib, vars, ...}: {
  services.timesyncd.enable = true; 
  time = {
    timeZone = lib.mkDefault "${vars.timezone}";
    # hardwareClockInLocalTime = lib.mkDefault true;
  };
}