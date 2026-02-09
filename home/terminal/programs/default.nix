{
  pkgs,
  ...
}: let
  tools = import ./toolchain {inherit pkgs;};
in {
  imports = [
    
    ./opencode
    ./yazi

    ./bat.nix
    ./btop.nix
    ./cli.nix
    ./fastfetch.nix
    ./fzf.nix
    ./git.nix
    ./gpg.nix
    ./lazydocker.nix
    ./lazygit.nix
    ./man.nix
    ./nix.nix
    ./ssh.nix
    ./xdg.nix
    ./zoxide.nix
  ];

  home.packages = with pkgs; [
    typst
    
    rustup

    go
    gopls
    delve

    jdk
    maven

    just
    gnumake

    gcc

    bun
    nodejs_24

    uv
    python314
    
    pkg-config
  ] ++ tools.packages;
}