{
  config,
  pkgs,
  vars,
  ...
}: {
  home.packages = with pkgs; [
    pinentry-gnome3
  ];

  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    enableZshIntegration = true;
    # pinentryPackage = pkgs.pinentry-gnome3;
    pinentry.package = pkgs.pinentry-gnome3;
    
    extraConfig = ''
      grab
    '';
  };

  home.sessionVariables = {
    GPG_TTY = "$(tty)";
  };
}