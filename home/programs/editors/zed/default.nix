{pkgs, ...}: let
  tools = import ../../../terminal/programs/toolchain {inherit pkgs;};

  zed-editorEnv = pkgs.buildEnv {
    name = "zed-editor-env";
    paths = tools.packages;
    pathsToLink = [
      "/bin" 
    ];
  };

  zed-editorWrapped =
    pkgs.runCommand "zed-editor-wrapped" {
      buildInputs = [pkgs.makeWrapper];
    } ''
      mkdir -p $out/bin
      mkdir -p $out/share

      makeWrapper ${pkgs.zed-editor}/bin/zeditor $out/bin/zeditor \
        --prefix PATH : ${zed-editorEnv}/bin


      for bin in ${pkgs.zed-editor}/bin/*; do
        if [ "$(basename $bin)" != "zeditor" ]; then
          ln -s $bin $out/bin/$(basename $bin)
        fi
      done


      cp -rs ${pkgs.zed-editor}/share/applications $out/share/
      cp -rs ${pkgs.zed-editor}/share/icons $out/share/
    '';
in {
  home.packages = [
    zed-editorWrapped
    # pkgs.zed-editor
  ];
}