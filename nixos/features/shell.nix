{ self, inputs, ... }:
{
  flake.nixosModules.shell =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        ripgrep
        zoxide
        fd
        gh
        fzf
        pfetch-rs
        fastfetch
        htop
        unzip
        lazygit
        gh-dash
      ];
      programs = {
        zsh = {
          enable = true;
          enableCompletion = true;
          autosuggestions.enable = true;
          ohMyZsh = {
            enable = true;
            plugins = [
              "git"
              "dirhistory"
            ];
          };
        };
        git.enable = true;
        tmux.enable = true;
        starship.enable = true;
        security.doas.enable = true;
        security.doas.extraRules = [{
          keepEnv = true; 
          persist = true;
        }];
        security.doas.wheelNeedsPassword = false;
        starship.settings = {
          add_newline = false;
          format = "$os$username$hostname$nix_shell$git_branch$git_commit$git_state$git_status$directory$jobs$cmd_duration$character";
          os = {
            disabled = false;
            symbols.NixOS = " ";
          };
        };
      };
    };
}
