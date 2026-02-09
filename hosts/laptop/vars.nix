let
  timezone = "Europe/Moscow";
  lc-extra = [ "ru_RU.UTF-8" ];
  username = "user";
  hostname = "nixos";
  gpg-default-key = "64F2DBDD0932A6CF";
in {
  inherit timezone;
  inherit lc-extra;

  inherit username;
  inherit hostname;
  inherit gpg-default-key;
  git = {
    email = "email@example.net";
    name = "user";
    signingKey = "${gpg-default-key}";
    
    github = {
      email = "81365126+ZarionX5@users.noreply.github.com";
      name = "ZarionX5";
      signingKey = "${gpg-default-key}";
    };
    
    gitlab = {
      email = "21143925-loek.n.v@users.noreply.gitlab.com";
      name = "loek.n.v";
      signingKey = "${gpg-default-key}";
    };
  };
}