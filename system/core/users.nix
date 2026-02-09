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
      "networkmanager"
      "plugdev"
      "transmission"
      "video"
      "wheel"
      "kvm"
    ];
  };
}