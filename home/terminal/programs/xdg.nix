{
  config,
  pkgs,
  ...
}:
let
  browser = [ "google-chrome" ];
  imageViewer = [ "org.gnome.Loupe" ];
  videoPlayer = [ "io.github.celluloid_player.Celluloid" ];
  audioPlayer = [ "io.bassi.Amberol" ];
  editor = [ "${config.home.sessionVariables.EDITOR}" ];

  xdgAssociations =
    type: program: list:
    builtins.listToAttrs (
      map (e: {
        name = "${type}/${e}";
        value = program;
      }) list
    );

  image = xdgAssociations "image" imageViewer [
    "png"
    "svg"
    "jpeg"
    "gif"
  ];
  video = xdgAssociations "video" videoPlayer [
    "mp4"
    "avi"
    "mkv"
  ];
  audio = xdgAssociations "audio" audioPlayer [
    "mp3"
    "flac"
    "wav"
    "aac"
  ];
  browserTypes =
    (xdgAssociations "application" browser [
      "json"
      "x-extension-htm"
      "x-extension-html"
      "x-extension-shtml"
      "x-extension-xht"
      "x-extension-xhtml"
      "xhtml+xml"
    ])
    // (xdgAssociations "x-scheme-handler" browser [
      "about"
      "chrome"
      "ftp"
      "http"
      "https"
      "unknown"
    ]);

  # XDG MIME types
  associations = builtins.mapAttrs (_: v: (map (e: "${e}.desktop") v)) (
    {
      "application/pdf" = [ "google-chrome" ];
      "text/html" = browser;
      "text/plain" = editor;
      "text/markdown" = editor;
      "inode/directory" = [ "yazi" ];
      "application/zip" = ["org.gnome.FileRoller.desktop"];
      "application/x-7z-compressed" = ["org.gnome.FileRoller.desktop"];
      "application/x-rar-compressed" = ["org.gnome.FileRoller.desktop"];
      "application/x-tar" = ["org.gnome.FileRoller.desktop"];
      "application/gzip" = ["org.gnome.FileRoller.desktop"];
      "x-scheme-handler/magnet" = [ "transmission-gtk" ];
      "x-scheme-handler/chrome" = ["google-chrome.desktop"];
      "x-scheme-handler/tg" = [ "org.telegram.desktop" ];
      "x-scheme-handler/tonsite" = [ "org.telegram.desktop" ];
    }
    // image
    // video
    // audio
    // browserTypes
  );
in
{
  xdg = {
    enable = true;
    cacheHome = config.home.homeDirectory + "/.local/cache";

    mimeApps = {
      enable = true;
      defaultApplications = associations;
    };

    userDirs = {
      enable = true;
      createDirectories = true;
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
      };
    };
  };

  home.packages = [
    (pkgs.writeShellScriptBin "xdg-terminal-exec" ''
      ghostty -e "$@"
    '')
    pkgs.xdg-utils
  ];
}