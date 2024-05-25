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
    language-servers.url = git+https://git.sr.ht/~bwolf/language-servers.nix;
    language-servers.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    # nixvim.url = "github:siph/nixvim-flake";
    # nixvim.url = "github:elythh/nixvim";
    nixvim.url = "github:axlEscalada/nixvim?rev=ae03f29a21fe7e815439a28414b52505a7b808cb";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    hyprland,
    zig,
    musnix,
    zls-flake,
    language-servers,
    nixvim,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
    overlays = [zig.overlays.default];
  in {
    nixosConfigurations = {
      axl = lib.nixosSystem rec {
        inherit system;
        specialArgs = {inherit nixvim hyprland zls-flake language-servers;};
        modules = [
          ./nixos/configuration.nix
          hyprland.nixosModules.default
          musnix.nixosModules.musnix
          {nixpkgs.overlays = overlays;}
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
