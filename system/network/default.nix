{pkgs, vars, ...}: {
  networking = {
    hostName = "${vars.hostname}";
    nameservers = [
      "1.1.1.1" 
      "1.0.0.1"
      "77.88.8.8"
      "77.88.8.1"
      "2a02:6b8::feed:0ff"
      "2a02:6b8:0:1::feed:0ff"
      "8.8.8.8" 
      "8.8.4.4" 
      "2001:4860:4860:8888" 
      "2001:4860:4860:8844"
    ];

    firewall = {
      enable = false;
      allowedUDPPorts = [ 21 22 80 443 ];
      allowedTCPPorts = [ 21 22 80 443 ];
      allowedUDPPortRanges = [{
        from = 1714;
        to = 1764;
      }];
      allowedTCPPortRanges = [{
        from = 1714;
        to = 1764;
      }];
    };
    # nftables.enable = true;

    networkmanager = {
      enable = true;
      # dns = "systemd-resolved";
      wifi.powersave = true;
      plugins = with pkgs; [
        networkmanager-openvpn
      ];
    };

    # useDHCP = false;
    # dhcpcd.enable = false;
  };

  services = {
    openssh = {
      enable = true;
      settings.UseDns = true;
    };
  };

  systemd.services.NetworkManager-wait-online.serviceConfig.ExecStart = [
    "" 
    "${pkgs.networkmanager}/bin/nm-online -q"
  ];

  # environment.etc.hosts.enable = false;
}