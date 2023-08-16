{ pkgs, ... } :
let
  kmonad = builtins.getFlake "github:kmonad/kmonad/ad69e1be793e61dce2d586481c0f6dda7d978c25?dir=nix";
in
{
  imports = [ kmonad.nixosModules.default ];

  services.kmonad = {
    enable = true;
    keyboards."eono" = {
      config = builtins.readFile ./keymap.kbd;
      device = "/dev/input/by-id/usb-SEMICO_USB_Gaming_Keyboard-event-kbd";
      defcfg = {
        enable = true;
	fallthrough = true;
      };
    };
  };
  
  environment.systemPackages = [ kmonad.packages.${pkgs.system}.default ];
}
