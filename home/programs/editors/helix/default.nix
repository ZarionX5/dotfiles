{
  inputs,
  pkgs,
  ...
}:let
  # package = inputs.helix.packages.${pkgs.stdenv.hostPlatform.system}.default;
  helix = pkgs.helix;
  tools = import ../../../terminal/programs/toolchain {inherit pkgs;};
in {
  programs.helix = {
    enable = true;
    package = helix;
    extraPackages = with pkgs; [
      shellcheck
    ] ++ tools.packages;

    settings = {
      theme = "gruvbox";
      editor = {
        color-modes = true;
        completion-trigger-len = 1;
        completion-replace = true;
        line-number = "relative";
        bufferline = "multiple";
        cursorline = true;
        undercurl = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        indent-guides = {
          render = true;
          rainbow-option = "dim";
        };
        inline-diagnostics = {
          cursor-line = "hint";
          other-lines = "error";
          max-diagnostics = 3;
        };
        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };
        soft-wrap.enable = true;
        gutters = ["diagnostics" "line-numbers" "spacer" "diff"];
        statusline.center = [ "position-percentage" ];
        true-color = true;
        trim-final-newlines = true;
        trim-trailing-whitespace = true;
        whitespace = {
          render = {
            space = "all";
            tab = "all";
            newline = "all";
          };
          characters = {
            space = " ";
            nbsp = "⍽";
            tab = "→";
            newline = "↴";
            tabpad = "-";
          };
        };
      };
    };
  };
  home.sessionVariables = {
    HELIX_RUNTIME = "${helix}/lib/runtime";
  };
}