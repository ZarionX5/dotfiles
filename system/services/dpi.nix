{inputs, ...}: {
  imports = [
    inputs.zapret-discord-youtube.nixosModules.default
  ];
  services.zapret-discord-youtube = {
    enable = true;
    # https://github.com/kartavkun/zapret-discord-youtube/tree/main/configs
    configName = "general (FAKE_TLS_AUTO_ALT3)";
    listGeneral = [ "youtube.com" "discord.com" ];

    listExclude = [ 
      "vk.ru"
      "ok.ru"
      "mail.ru"
      "rutube.ru"
      "ya.ru"
      "nixos.org"
      "nix.org"
    ];
    
    ipsetAll = [ 
      "1.1.1.1" 
      "1.0.0.1"
      "77.88.8.8"
      "77.88.8.1"
      "8.8.8.8" 
      "8.8.4.4" 
    ];
    
    ipsetExclude = [ "192.168.1.0/24" "10.0.0.0/8" "127.0.0.0/8" "172.16.0.0/12"];
  };
}