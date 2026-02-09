{
  lib,
  vars,
  config,
  pkgs,
  ...
}: {
  programs.dconf.profiles."${vars.username}".databases = [
    {
      # lockAll = true;
      settings = {
        "org/gnome/desktop/interface" = {
          accent-color = "slate";
          color-scheme = "prefer-dark";
          font-antialiasing = "grayscale";
          font-hinting = "slight";
          clock-show-seconds = true;
          clock-show-weekday = true;
          enable-hot-corners = false;
          toolkit-accessibility = true;
          show-battery-percentage = true;
        };
        "org/gnome/desktop/input-sources" = {
          show-all-sources = true;
          sources = [
            (lib.gvariant.mkTuple ["xkb" "us"])
            (lib.gvariant.mkTuple ["xkb" "ru"]) 
          ];
        };

        "org/gnome/settings-daemon/plugins/color" = {
          night-light-enable = true;
          night-light-schedule-automatic = false;
          night-light-schedule-from = "18.0";
          night-light-schedule-to = "6.0";
          night-light-temperature = "3666";
        };

        "org/gnome/shell/keybindings" = {
          focus-active-notification = ["<Control><Super>n"];
          toggle-message-tray = ["<Super>n"];
        };

        "org/gnome/settings-daemon/plugins/media-keys" = {
          help = lib.gvariant.mkEmptyArray lib.gvariant.type.string;
          custom-keybindings = [
            "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
            "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
          ];
        };
        
        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
          name = "terminal";
          command = let 
            shell = "zsh";
            in 
            "xdg-terminal-exec ${shell} -c \"fastfetch; exec ${shell}\" ";
          binding = "<Super>t";
        };
        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
          name = "top";
          command = "xdg-terminal-exec btop";
          binding = "<Shift><Super>TouchpadOff";
        };
        "org/gnome/shell" = {
          disable-user-extensions = false;
          enabled-extensions = [
            "another-window-session-manager@gmail.com"
            "appindicatorsupport@rgcjonas.gmail.com"
            "clipboard-indicator@tudmotu.com"
            "dash-to-dock@micxgx.gmail.com"
          ];
        };
        
        "org/gnome/shell/extensions/clipboard-indicator" = {
          move-item-first = true;
          strip-text = true;
          clear-history = [ "" ];
          next-entry = [ "" ];
          prev-entry = [ "" ];
          private-mode-binding = [ "" ];
          toggle-menu = [ "<Super>v" ];
        };
        "org/gnome/shell/extensions/another-window-session-manager" = {
          enable-restore-previous-session = true;
          restore-previous-delay = "0";
        };
      };
    }
  ];
}