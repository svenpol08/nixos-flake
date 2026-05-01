{ self, inputs, ... }:
{
  flake.nixosModules.llm =
    { pkgs, ... }:
    {
      services.ollama = {
        enable = true;
        package = pkgs.ollama.override { acceleration = "rocm"; };
        syncModels = true;
        loadModels = [
          #"mathstral:7b"
          #"medgemma1.5:4b"
          "aravhawk/gemma4:26b"
          "jaahas/qwen3.5-uncensored:9b"
        ];
      };
      environment.systemPackages = with pkgs; [
        pi-coding-agent
      ];
    };
}
