{
  description = "NixOS + home-manager config flakes!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
  };

  outputs = {nixpkgs, ...}: let
    forAllSystems = nixpkgs.lib.genAttrs [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
  in {
    templates = {
      standard = {
        description = ''
          Standard flake - augmented with boilerplate for custom packages, overlays, and reusable modules.
          Perfect migration path for when you want to dive a little deeper.
        '';
        path = ./dotnix;
      };
    };
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
  };
}