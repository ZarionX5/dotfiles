{
  services = {
    logind.settings.Login = {
      powerKey = "suspend";
      lidSwitch = "suspend";
      lidSwitchExternalPower = "lock";
    };

    power-profiles-daemon.enable = true;

    upower = {
      enable = true;
      percentageLow = 30;
      percentageCritical = 20;
      percentageAction = 5;
      criticalPowerAction = "PowerOff";
    };
  };

  systemd.sleep.extraConfig = ''
    AllowSuspend=yes
    AllowHibernation=no
    AllowSuspendThenHibernate=no
    AllowHybridSleep=no
  '';
}