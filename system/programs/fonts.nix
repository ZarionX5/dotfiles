{ pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      nerd-fonts.symbols-only
      material-symbols

      jetbrains-mono
      nerd-fonts.jetbrains-mono
      fira-code
      
      inter
      roboto
      libertinus

      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
    ];

    enableDefaultPackages = false;

    fontconfig = {
      enable = true;
      antialias = true;
      
      hinting = {
        enable = true;
        autohint = false;
        style = "slight";
      };

      subpixel = {
        lcdfilter = "default";
        rgba = "rgb";
      };

      defaultFonts = {
        monospace = [ "JetBrains Mono Nerd Font" "Symbols Nerd Font" "Noto Color Emoji" ];
        sansSerif = [ "Inter" "Symbols Nerd Font" "Noto Color Emoji" ];
        serif     = [ "Libertinus Serif" "Symbols Nerd Font" "Noto Color Emoji" ];
        emoji     = [ "Noto Color Emoji" ];
      };
    };

    fontDir = {
      enable = true;
      decompressFonts = true;
    };
  };
}
