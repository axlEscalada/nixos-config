{
  description = "My flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    zig.url = "github:mitchellh/zig-overlay";
    musnix.url = "github:musnix/musnix";
    zls-flake = {
      url = "github:zigtools/zls";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    language-servers.url = "git+https://git.sr.ht/~bwolf/language-servers.nix";
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
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      # add ?ref=<tag> to track a tag
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      # THIS IS IMPORTANT
      # Mismatched system dependencies will lead to crashes and other issues.
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix.url = "github:Mic92/sops-nix";
    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    caelestia-cli = {
      url = "github:caelestia-dots/cli";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # marble = {
    #   url = "github:marble-shell/shell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      hyprland,
      zig,
      musnix,
      zls-flake,
      language-servers,
      nixvim,
      quickshell,
      caelestia-shell,
      caelestia-cli,
      ...
    }:
    let
      lib = nixpkgs.lib;
      overlays = [
        zig.overlays.default
        # (final: prev: {
        #   foliate = final.callPackage ./derivations/foliate.nix { };
        # })
      ];
    in
    {
      formatter = {
        x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
      };

      packages.x86_64-linux = {
        default = nixpkgs.legacyPackages.x86_64-linux.callPackage ./ags { inherit inputs; };
        # foliate = nixpkgs.legacyPackages.x86_64-linux.callPackage ./foliate.nix { };
      };

      nixosConfigurations = {
        axl = lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = {
            inherit
              inputs
              nixvim
              hyprland
              zls-flake
              language-servers
              caelestia-shell
              caelestia-cli
              ;
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
