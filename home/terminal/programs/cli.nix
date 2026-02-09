{
  pkgs,
  config,
  ...
}:
{
  home.packages = with pkgs; [
    # archives
    zip
    unzip
    unrar

    # misc
    chafa
    libnotify
    sshfs

    # utils
    dust
    duf
    fd
    file
    jaq
    ripgrep
    ripdrag
  ];

  programs = {
    eza.enable = true;
  };
}