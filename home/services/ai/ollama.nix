{pkgs, ...}: {
  services.ollama = {
    enable = true;
    package = pkgs.ollama-vulkan;
    # qwen2.5-coder:7b-instruct-q4_K_M
  };
}