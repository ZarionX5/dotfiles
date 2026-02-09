{pkgs, ...}: {
  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        intel-compute-runtime
        intel-ocl
        vulkan-loader
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        intel-media-driver
        intel-compute-runtime
        vulkan-loader
      ];
    };
  };
}