{ pkgs, vars, ... }:
{
  users.users."${vars.username}" = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "adbusers"
      "audio"
      "dialout"
      "docker"
      "input"
      "libvirtd"
      "lp"
      "networkmanager"
      "plugdev"
      "transmission"
      "tty"
      "video"
      "scanner"
      "wheel"
      "kvm"
    ];
  };
}
