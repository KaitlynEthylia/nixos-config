{ config, pkgs, ... }@inputs:

{
  imports = [
    ./shell
    # ./graphics
  ];

  nix.enable = true;
  nix.settings.use-xdg-base-directories = true;

  home.username = "kaitlyn";
  home.homeDirectory = "/home/kaitlyn";

  xdg = {
    enable = true;
    dataHome = /. + "${config.home.homeDirectory}/.local/share";
    stateHome = /. + "${config.home.homeDirectory}/.local/state";
    cacheHome = /. + "${config.home.homeDirectory}/.local/cache";
    configHome = /. + "${config.home.homeDirectory}/.config";
  };

  home.packages = with pkgs; [
    neovim
  ];

  programs.git = {
    enable = true;
    userName = "Kaitlyn~Ethylia";
    userEmail = "kaitlyyn.ethylia@proton.me";
    extraConfig = {
      init.defaultBranch = "mistress";
      core = {
        autocrlf = false;
	eol = "lf";
      };
    };
    # add signing and auth stuff when ssh and gnupg setup
  };

  home.sessionVariables = {
    VISUAL = "nvim";
    EDITOR = "nvim";
    PAGER = "bat";
    MANPAGER = "bat -l man";

    LOCAL = "$HOME/.local";
  };

  home.sessionPath = [
    "$XDG_STATE_HOME/nix/profile/bin"
    "$XDG_BIN_HOME"
    "${config.home.homeDirectory}/Scripts"
  ];

  home.stateVersion = "22.11";
  programs.home-manager.enable = true;
}
