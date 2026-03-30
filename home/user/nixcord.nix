{
  programs.nixcord = {
    enable = true;
    discord.vencord.enable = false;
    discord.equicord.enable = true;
    
    # Theming
    quickCss = "/* css goes here */";
    config = {
      useQuickCss = true;
      themeLinks = [];
      frameless = true;
    };
  };
}
