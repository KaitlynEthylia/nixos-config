{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    exa
    zoxide
    lf
  ];

  home.sessionVariables = {
    STARSHIP_CACHE = "$XDG_CACHE_HOME";
    BAT_CACHE_PATH = "$XDG_CACHE_HOME";
  };

  # TODO i just noticed the lfcd file is missing but i'll fix that later
  home.file."${config.xdg.configHome}/lf" = {
    source = ./lf;
    recursive = true;
  };

  programs.fzf.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    dotDir = "${config.xdg.configHome}/zsh";
    defaultKeymap = "emacs";
    cdpath = [ "~" ];
    history.path = "$XDG_DATA_HOME/zsh/.zsh_history";
    syntaxHighlighting.enable = true;
    plugins = [
      {
        name = "zsh-autocomplete";
	src = pkgs.fetchFromGitHub {
	  owner = "marlonrichert";
	  repo = "zsh-autocomplete";
	  rev = "6d059a3634c4880e8c9bb30ae565465601fb5bd2";
	  sha256 = "0NW0TI//qFpUA2Hdx6NaYdQIIUpRSd0Y4NhwBbdssCs="; 
	};
      }
    ];
    shellAliases = {
      ls = "exa -la --group-directories-first";
      lg = "ls --git";
      tree = "ls --tree";

      v = "nvim";

      rb = "doas reboot";
      sd = "doas shutdown now";

      c = "z";
      ci = "ci";

      "d!" = "doas $(fc -lrn | head -1)";

      nixrb = "doas nixos-rebuild switch --flake ~/KaitlynEthylia/#nix";
    };
    initExtra = ''
      set globdots

      bindkey ^S fzf-cd-widget
      bindkey "''${key[Up]}" up-line-or-search
    '';
  };

  programs.starship = import ./starship.nix;

  programs.bat = {
    enable = true;
    config = {
      theme = "catppuccin";
      style = [
        "numbers"
	"grid"
      ];
    };
    themes = {
      catppuccin = builtins.readFile ./bat/catppuccin.tmTheme;
      tokyonight = builtins.readFile ./bat/tokyonight.tmTheme;
      rose-pine = builtins.readFile ./bat/rose-pine.tmTheme;
    };
  };
}
