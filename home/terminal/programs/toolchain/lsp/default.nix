{pkgs}: let 
  lspBins = {
    ruff = "${pkgs.ruff}/bin/ruff";
    pyright = "${pkgs.pyright}/bin/pyright-langserver";

    clangd = "${pkgs.clang-tools}/bin/clangd";
    
    vscode-css-lsp = "${pkgs.vscode-langservers-extracted}/bin/vscode-css-language-server";
    vscode-html-lsp = "${pkgs.vscode-langservers-extracted}/bin/vscode-html-language-server";
    vscode-json-lsp = "${pkgs.vscode-langservers-extracted}/bin/vscode-json-language-server";
    # vscode-markdown-lsp = "${pkgs.vscode-langservers-extracted}/bin/vscode-markdown-language-server";
    typescript-lsp = "${pkgs.typescript-language-server}/bin/typescript-language-server";
    biome = "${pkgs.biome}/bin/biome";
    
    bash-lsp = "${pkgs.bash-language-server}/bin/bash-language-server";
    
    nil = "${pkgs.nil}/bin/nil";

    tinymist = "${pkgs.tinymist}/bin/tinymist";
    
    taplo = "${pkgs.taplo}/bin/taplo";
  };
in {
  packages = with pkgs; [
    # Python
    ruff
    pyright
    # C/C++
    clang-tools
    # Web
    vscode-langservers-extracted
    typescript-language-server
    biome
    # Bash
    bash-language-server
    # Nix
    nil
    # Typst
    tinymist
    # Toml
    taplo
  ];

  inherit lspBins;

  lspCmds = {
    ruff = [ "${lspBins.ruff}" "server" ];
    pyright = [ "${lspBins.pyright}" "--stdio" ];
    
    clangd  = [ "${lspBins.clangd}"  "--background-index" ];

    vscode-css-lsp = [ "${lspBins.vscode-css-lsp}" ];
    vscode-html-lsp = [ "${lspBins.vscode-html-lsp}" ];
    vscode-json-lsp = [ "${lspBins.vscode-json-lsp}" ];
    # vscode-markdown-lsp = [ "${lspBins.vscode-markdown-lsp}" ];
    typescript-lsp = [ "${lspBins.typescript-lsp}" "--stdio" ];
    biome  = [ "${lspBins.biome}" "lsp-proxy" ];

    bash-lsp = [ "${lspBins.vscode-css-lsp}" "start" ];

    nil = [ "${lspBins.nil}" ];

    tinymist = [ "${lspBins.tinymist}" ];

    taplo = [ "${lspBins.taplo}" "lsp" "stdio" ];
  };
}