{
  description = "NixOS Flake";

  outputs = inputs:
  inputs.flake-parts.lib.mkFlake { inherit inputs; } {
    systems = [ "x86_64-linux" ];

    imports = [ ./hosts ];

    perSystem = {
        config,
        pkgs,
        ...
      }: {
      devShells = {
        default = pkgs.mkShell {
          packages = [pkgs.git];
          name = "nixos-dots";
          env.DIRENV_LOG_FORMAT = "";
        };
      };
    };

  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    hm = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nix-index-db = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/"; # ?ref=latest

    # helix.url = "github:helix-editor/helix";
    
    zapret-discord-youtube.url = "github:kartavkun/zapret-discord-youtube";
    
    # opencode = {
    #   url = "github:anomalyco/opencode/v1.1.48";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    llm-skills-agentic-qe.url = "github:proffesor-for-testing/agentic-qe/main";
    llm-skills-agentic-qe.flake = false;

    llm-skills-dotfiles.url = "github:nicknisi/dotfiles/f1be3f2b669c8e3401b589141f9a56651e45a1a7";
    llm-skills-dotfiles.flake = false;

    llm-skills-claude-code.url = "github:anthropics/claude-code/main";
    llm-skills-claude-code.flake = false;

    llm-skills-agents.url = "github:wshobson/agents/main";
    llm-skills-agents.flake = false;

    llm-skills-ccconfigs.url = "github:dhruvbaldawa/ccconfigs/main";
    llm-skills-ccconfigs.flake = false;

    llm-skills-skills-repo.url = "github:anthropics/skills/main";
    llm-skills-skills-repo.flake = false;

    llm-skills-mjs-agent-skills.url = "github:mjunaidca/mjs-agent-skills/main";
    llm-skills-mjs-agent-skills.flake = false;

    llm-skills-everything-claude-code.url = "github:affaan-m/everything-claude-code/main";
    llm-skills-everything-claude-code.flake = false;

    llm-skills-typst.url = "github:lucifer1004/claude-skill-typst/main";
    llm-skills-typst.flake = false;

    llm-skills-awesome.url = "github:sickn33/antigravity-awesome-skills/main";
    llm-skills-awesome.flake = false;
  };

}