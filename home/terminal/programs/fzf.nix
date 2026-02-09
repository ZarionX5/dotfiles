{ pkgs, ... }: {
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultOptions = [
      "--reverse"
      "--height 40%"
      "--border"
    ];
  };
}
