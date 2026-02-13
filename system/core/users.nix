{ pkgs, vars, ... }:
{
  users.users."${vars.username}" = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "adbusers"
      "audio"
      "docker"
      "input"
      "libvirtd"
      "lp"
      "networkmanager"
      "plugdev"
      "transmission"
      "video"
      "scanner"
      "wheel"
      "kvm"
    ];
  };
}
