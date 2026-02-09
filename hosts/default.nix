{
  self,
  inputs,
  ...
}: {  
  flake.nixosConfigurations = let 
    inherit (inputs.nixpkgs.lib) nixosSystem;
    mkSystem = { vars, modules }: nixosSystem {
      specialArgs = { 
        inherit self inputs vars; 
      };
      modules = [
        {
          home-manager = {
            extraSpecialArgs = { 
              inherit self inputs vars; 
            };
            backupFileExtension = ".hm-backup";
          };
        }
      ] ++ modules;
    };
    in {
    laptop = let
      homeImports = import "${self}/home/profiles";

      mod = "${self}/system";

      inherit (import "${mod}") desktop laptop;

      vars = import "${self}/hosts/laptop/vars.nix";
    in
    mkSystem {
      inherit vars;
      modules =
      desktop
      ++ laptop
      ++ [
        ./laptop

        "${mod}/programs/gamemode.nix"
        "${mod}/programs/games.nix"
        "${mod}/programs/qt.nix"
        "${mod}/programs/gpg.nix"

        "${mod}/services/gnome-services.nix"
        "${mod}/services/docker.nix"
        "${mod}/services/location.nix"
        "${mod}/services/dpi.nix"
        "${mod}/services/flatpak.nix"

        "${mod}/programs/gnome"

        {
          home-manager.users."${vars.username}".imports = homeImports."laptop";
        }
      ];
    };
    # wsl = mkSystem {
    #   vars = import "./wsl/vars.nix";
    #   modules = [
    #     ./wsl
    #   ];
    # };
  };
}