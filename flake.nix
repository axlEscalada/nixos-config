{
  description = "My flake";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    zig.url = "github:mitchellh/zig-overlay";
    musnix.url = "github:musnix/musnix"; 
    zls-flake = {
      url = github:zigtools/zls;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
     url = "github:nix-community/home-manager";
     inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, home-manager, hyprland, zig, musnix, zls-flake, ...}: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
  	  config.allowUnfree = true;	
    };
    lib = nixpkgs.lib;
    overlays = [ zig.overlays.default ];
  in {
  nixosConfigurations = {
    axl = lib.nixosSystem rec {
        inherit system;
        specialArgs = { inherit hyprland zls-flake; };
        modules = [ 
          ./nixos/configuration.nix
          hyprland.nixosModules.default
        	musnix.nixosModules.musnix
        	{ nixpkgs.overlays = overlays; }
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.axl = import ./home/home.nix;
            home-manager.extraSpecialArgs = specialArgs;
          }
        ];
        
      };
    };
  };
}
