{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true; };
    };
  in {
    nixosConfigurations.nix = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit system; };
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager.users.kaitlyn = import ./modules/home;
        }
      ];
    };
  };
}
