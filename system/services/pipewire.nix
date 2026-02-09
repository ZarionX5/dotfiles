{ lib, pkgs, ... }:

{
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
    pulse.enable = true;

    extraConfig.pipewire."99-custom" = {
      "context.properties" = {
        "default.clock.rate" = 48000;
        "default.clock.quantum" = 1024;
        "default.clock.min-quantum" = 32;
        "default.clock.max-quantum" = 2048;
      };
    };

    wireplumber = {
      enable = true;
      extraConfig = {
        "10-bluetooth-hifi" = {
          "monitor.bluez.properties" = {
            "bluez5.enable-sbc-xq" = true;
            "bluez5.enable-msbc" = true;
            "bluez5.enable-hw-volume" = true;
            "bluez5.headset-roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];
            "bluez5.a2dp.ldac.quality" = "auto";
            "bluez5.a2dp.aac.bitratemode" = 0;
            "bluez5.default.rate" = 48000;
            "bluez5.default.channels" = 2;
            # "bluez5.headset-profile" = "a2dp-only";
          };
        };
        # "10-disable-camera" = {
        #   "wireplumber.profiles" = {
        #     "main" = {
        #       "monitor.libcamera" = "disabled";
        #     };
        #   };
        # };
      };
    };
  };

  services.pulseaudio.enable = lib.mkForce false;
}
