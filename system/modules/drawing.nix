{ pkgs, ...}:
{
  environment.systemPackages = with pkgs; [ krita ];
  programs.xppen.enable = true;
}
