{pkgs}: let
  formatterBins = {
    ruff = "${pkgs.ruff}/bin/ruff";

    clang = "${pkgs.clang-tools}/bin/clang-format";
    
    prettier = "${pkgs.prettier}/bin/prettier"; # html yaml markdown scss xml
    biome = "${pkgs.biome}/bin/biome"; # css json js ts 
    
    shfmt = "${pkgs.shfmt}/bin/shfmt";
    
    nixfmt = "${pkgs.nixfmt}/bin/nixfmt";

    typstyle = "${pkgs.typstyle}/bin/typstyle";
    
    taplo = "${pkgs.taplo}/bin/taplo";
  };
in {
  packages = with pkgs; [
    # Python
    ruff
    # C/C++
    clang-tools
    # Web
    prettier
    biome
    # Bash
    shfmt
    # Nix
    nixfmt
    # Typst
    typstyle
    # Toml
    taplo
  ];

  inherit formatterBins;

  formatterCmds = {
    ruff = [ "${formatterBins.ruff}" "check" "--select" "I" "--fix" "&&" 
             "${formatterBins.ruff}" "format" "--line-length" "150" ];
    
    clang = [ "${formatterBins.clang}" "--assume-filename"];

    biome = [ "${formatterBins.biome}" "format" "--stdin-file-path" ];
    prettier = [ "${formatterBins.prettier}" "--stdin-filepath" ];

    shfmt = [ "${formatterBins.shfmt}" "-i" "2" ];

    nixfmt = [ "${formatterBins.nixfmt}" "--indent" "2" "-w" "150"];

    typstyle = [ "${formatterBins.typstyle}" "--indent-width" "2" "--line-width" "150"];

    taplo = [ "${formatterBins.taplo}" "fmt" "-" ];
  };
}