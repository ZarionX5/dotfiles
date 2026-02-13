{ pkgs, ... }: {
  services = {
    printing = {
      enable = true;
      drivers = [
        # pkgs.gutenprint-bin
        pkgs.canon-cups-ufr2
      ];
    };
    udev.packages = [ pkgs.sane-backends ];
  };
}
