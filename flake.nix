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
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    # Hypridle
    hypridle.url = "github:hyprwm/Hypridle";
    # Hyprlock
    hyprlock = {
      url = "github:hyprwm/Hyprlock";
      # NOTE: required to prevent red screen on lock
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:axlEscalada/nixvim";
    matugen.url = "github:Iniox/matugen?ref=v2.0.0";
    # ags.url = "github:axlEscalada/ags";
    ags = {
      url = "github:Aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    astal.url = "github:Aylur/astal";
    ghostty = {
      # url = "git+ssh://git@github.com/ghostty-org/ghostty";
      url = "github:ghostty-org/ghostty";

      # NOTE: The below 2 lines are only required on nixos-unstable,
      # if you're on stable, they may break your build
      inputs.nixpkgs-stable.follows = "nixpkgs";
      inputs.nixpkgs-unstable.follows = "nixpkgs";
    };
  };

  outputs =
    inputs @ { self
    , nixpkgs
    , home-manager
    , hyprland
    , zig
    , musnix
    , zls-flake
    , language-servers
    , nixvim
    , ghostty
    , ...
    }:
    let
      lib = nixpkgs.lib;
      overlays = [
        zig.overlays.default
        (final: prev: {
          foliate = final.callPackage ./derivations/foliate.nix { };
        })
      ];
    in
    {
      formatter = {
        x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
      };

      packages.x86_64-linux = {
        default = nixpkgs.legacyPackages.x86_64-linux.callPackage ./ags { inherit inputs; };
        foliate = nixpkgs.legacyPackages.x86_64-linux.callPackage ./foliate.nix { };
      };

      nixosConfigurations = {
        axl = lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs nixvim hyprland zls-flake language-servers ghostty;
            asztal = self.packages.x86_64-linux.default;
          };
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
