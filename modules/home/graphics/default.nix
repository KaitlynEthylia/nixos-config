# This entire file is one massive TODO, nothing has been configured yet 
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    eww
    wezterm
    seatd
    mako # I'm more familiar with mako but i don want to give dunst a try as it looks pretty powerfull
    libnotify
    hyprpaper
    bemenu
    firefox
    wl-clipboard
  ];

  home.sessionVariables = {
    NIXOS_OXONE_WL="1";
  };

  # Not working yet, hopefully home manager issue #4346 will have a solution eventually
  home.file = {
    hypr = {
      source = ./hypr;
      target = config.home.homeDirectory;
      recursive = true;
    };
    eww = {
      source = ./eww;
      target = config.home.homeDirectory;
      recursive = true;
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
