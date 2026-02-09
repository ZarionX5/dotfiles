{
  boot.kernel.sysctl = {
    "kernel.sysrq" = 0;

    "net.ipv4.icmp_ignore_bogus_error_responses" = 1;
    "net.ipv4.conf.default.rp_filter" = 1;
    "net.ipv4.conf.all.rp_filter" = 1;
    "net.ipv4.conf.all.accept_source_route" = 0;
    "net.ipv6.conf.all.accept_source_route" = 0;
    "net.ipv4.conf.all.send_redirects" = 0;
    "net.ipv4.conf.default.send_redirects" = 0;
    "net.ipv4.conf.all.accept_redirects" = 0;
    "net.ipv4.conf.default.accept_redirects" = 0;
    "net.ipv4.conf.all.secure_redirects" = 0;
    "net.ipv4.conf.default.secure_redirects" = 0;
    "net.ipv6.conf.all.accept_redirects" = 0;
    "net.ipv6.conf.default.accept_redirects" = 0;

    "net.ipv4.tcp_syncookies" = 1;
    "net.ipv4.tcp_rfc1337" = 1;

    "net.ipv4.tcp_fastopen" = 3;

    "net.ipv4.ip_forward" = 1;
    "net.ipv4.tcp_congestion_control" = "bbr";
    "net.core.default_qdisc" = "cake";
    
    "net.core.rmem_default" = 262144;
    "net.core.rmem_max" = 134217728;
    "net.core.wmem_default" = 262144;
    "net.core.wmem_max" = 134217728;

    # TCP buffer sizes
    "net.ipv4.tcp_rmem" = "4096 131072 134217728";
    "net.ipv4.tcp_wmem" = "4096 65536 134217728";

    # TCP performance
    "net.ipv4.tcp_window_scaling" = 1;
    "net.ipv4.tcp_timestamps" = 1;
    "net.ipv4.tcp_sack" = 1;
    "net.ipv4.tcp_fack" = 1;
    "net.ipv4.tcp_low_latency" = 1;
    "net.ipv4.tcp_adv_win_scale" = 1;

    # Reduce TIME_WAIT sockets
    "net.ipv4.tcp_fin_timeout" = 15;
    "net.ipv4.tcp_tw_reuse" = 1;
  };

  boot.kernelModules = [ "tcp_bbr" ];

  security = {
    pam.services.hyprlock.text = "auth include login";

    rtkit.enable = true;
    polkit.enable = true;

    sudo-rs = {
      enable = true;
      execWheelOnly = true;
      wheelNeedsPassword = false;
    };
    sudo.wheelNeedsPassword = false;
  };
}