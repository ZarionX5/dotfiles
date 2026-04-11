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
    act
    pre-commit
    
    yq
    tree
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