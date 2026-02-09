{
  pkgs,
  inputs,
  ...
}: let
  languages = import ./languages.nix {inherit pkgs;};
  mcp = import ./mcp.nix;
  providers = import ./providers.nix;
  permissions = import ./permissions.nix;
  skills = import ./skills.nix {inherit pkgs; inherit inputs;};

  # opencode = inputs.opencode.packages.${pkgs.stdenv.hostPlatform.system}.default;
  opencode = pkgs.opencode;

  opencodeEnv = pkgs.buildEnv {
    name = "opencode-env";
    paths =
      languages.packages
      ++ skills.packages;
    pathsToLink = [
      "/bin" 
    ];
  };

  opencodeInitScript = pkgs.writeShellScript "opencode-init" ''
    mkdir -p "$HOME/.local/cache/opencode/node_modules/@opencode-ai"
    mkdir -p "$HOME/.config/opencode/node_modules/@opencode-ai"
    if [ -d "$HOME/.config/opencode/node_modules/@opencode-ai/plugin" ]; then
      if [ ! -L "$HOME/.local/cache/opencode/node_modules/@opencode-ai/plugin" ]; then
        ln -sf "$HOME/.config/opencode/node_modules/@opencode-ai/plugin" \
               "$HOME/.local/cache/opencode/node_modules/@opencode-ai/plugin"
      fi
    fi
    exec ${opencode}/bin/opencode "$@"
  '';

  opencodeWrapped =
    pkgs.runCommand "opencode-wrapped" {
      buildInputs = [pkgs.makeWrapper];
    } ''
      mkdir -p $out/bin
      mkdir -p $out/share
      
      makeWrapper ${opencodeInitScript} $out/bin/opencode \
        --prefix PATH : ${opencodeEnv}/bin \
        --set OPENCODE_LIBC ${pkgs.glibc}/lib/libc.so.6

      if [ -d "${opencode}/share" ]; then
        cp -rs ${opencode}/share/* $out/share/
      fi
    '';
  configFile = "opencode/config.json";
in {
  home.packages = [
    opencodeWrapped
  ];
  xdg.configFile = {
    "${configFile}".text = builtins.toJSON {
      "$schema" = "https://opencode.ai/config.json";
      autoupdate = false;
      share = "disabled";
      theme = "gruvbox";
      # plugin = ["opencode-antigravity-auth@1.4.1"];
      mcp = mcp.config;
      formatter = languages.formatter;
      lsp = languages.lsp;
      provider = providers.config;
      permission = permissions.config;
    };
    "opencode/skill".source = skills.skillsSource + "/skill";
  };
}