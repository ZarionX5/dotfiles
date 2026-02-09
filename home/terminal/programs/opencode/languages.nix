{pkgs}: let
  tools = import ../toolchain {inherit pkgs;};
  formatterCmds = tools.formatterCmds;
  lspCmds = tools.lspCmds;
in {
  packages = with pkgs; [
  ] 
  ++ tools.packages;

  formatter = {
    ruff = {
      command = formatterCmds.ruff;
      extensions = [ "py" ];
    };
    
    clang = {
      command = formatterCmds.clang;
      extensions = [ "h" "hpp" "c" "cpp" ];
    };

    biome = {
      command = formatterCmds.biome;
      extensions = ["js" "ts" "json" "jsx" "tsx" "css" ];
    };
    prettier = {
      command = formatterCmds.prettier;
      extensions = ["html" "scss" "yaml" "md" "xml"];
    };

    shfmt = {
      command = formatterCmds.shfmt;
      extensions = ["sh" "bash" "zsh"];
    };

    nixfmt = {
      command = formatterCmds.nixfmt;
      extensions = ["nix"];
    };

    typstyle = {
      command = formatterCmds.typstyle;
      extensions = ["typ"];
    };

    taplo = {
      command = formatterCmds.taplo;
      extensions = ["toml"];
    };
  };

  lsp = {
    ruff = {
      command = lspCmds.ruff;
      extensions = [ "py" ];
    };
    pyright = {
      command = lspCmds.pyright;
      extensions = [ "py" ];
      initialization = {
        settings = {
          pyright = {
            disableOrganizeImports = true;
          };
          python = {
            analysis = {
              ignore = [ "*" ];
              typeCheckingMode = "standard";
            };
          };
        };
      };
    };
    
    clangd  = {
      command = lspCmds.clangd;
      extensions = [ "h" "hpp" "c" "cpp" ];
    };

    vscode-css-lsp = {
      command = lspCmds.vscode-css-lsp;
      extensions = [ "css" ];
    };
    vscode-html-lsp = {
      command = lspCmds.vscode-html-lsp;
      extensions = [ "html" ];
    };
    vscode-json-lsp = {
      command = lspCmds.vscode-json-lsp;
      extensions = [ "json" ];
    };
    typescript-lsp = {
      command = lspCmds.typescript-lsp;
      extensions = [ "ts" ];
    };
    biome  = {
      command = lspCmds.biome;
      extensions = [ "js" "ts" "json" "jsx" "tsx" "css"];
    };

    bash-lsp = {
      command = lspCmds.bash-lsp;
      extensions = [ "sh" "bash" "zsh" ];
    };

    nil = {
      command = lspCmds.nil;
      extensions = [ "nix" ];
    };

    tinymist = {
      command = lspCmds.tinymist;
      extensions = [ "typ" ];
    };

    taplo = {
      command = lspCmds.taplo;
      extensions = [ "toml" ];
    };
  };
}