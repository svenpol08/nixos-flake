{ pkgs, ... }:

{
  programs.zsh = {
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
  programs.starship.enable = true;
  programs.starship.settings = {
    add_newline = false;
    format = "$os$username$hostname$nix_shell$git_branch$git_commit$git_state$git_status$directory$jobs$cmd_duration$character";
    os = {
      disabled = false;
      symbols.NixOS = " ";
    };
  };
}
