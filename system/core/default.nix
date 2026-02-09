{lib, vars, ...}: {
  imports = [
    ./time.nix
    ./security.nix
    ./users.nix
    ../nix
    ../programs/zsh.nix
  ];

  documentation.dev.enable = true;

  i18n = let
    lc-extra = vars.lc-extra;
    extraLocale = builtins.head vars.lc-extra;
  in {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "${extraLocale}";
      LC_IDENTIFICATION = "${extraLocale}";
      LC_MEASUREMENT = "${extraLocale}";
      LC_MONETARY = "${extraLocale}";
      LC_NAME = "${extraLocale}";
      LC_NUMERIC = "${extraLocale}";
      LC_PAPER = "${extraLocale}";
      LC_TELEPHONE = "${extraLocale}";
      LC_TIME = "${extraLocale}";
    };
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
    ] ++ (map (item: "${item}/UTF-8") lc-extra);
  };

  console.keyMap = "la-latin1";

  system = {
    switch.enable = true;
    stateVersion = lib.mkDefault "25.11";
  };

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 25;
  };
}