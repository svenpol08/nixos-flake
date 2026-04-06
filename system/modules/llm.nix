{ pkgs, ...}:

{
  services.ollama = {
    enable = true;
    package = pkgs.ollama-vulkan;
    syncModels = true;
    loadModels = [
      "mathstral:7b"
      "jaahas/qwen3.5-uncensored:9b"
    ];
  };
  environment.systemPackages =  with pkgs; [ 
    pi-coding-agent 
  ];
}
