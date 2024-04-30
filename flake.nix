{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nixvim.url = "github:luckycyang/nixvim";
  };
  outputs = {
    self,
    nixpkgs,
    nixvim,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem
    (
      system: let
        pkgs = import nixpkgs {inherit system;};
      in {
        devShells = rec {
          embed = pkgs.mkShell {
            name = "embed";
            buildInputs = with pkgs; [
              openocd
              gnumake
              ninja
              cmake
              gcc-arm-embedded
            ];
          };
          default = embed;
        };
        # flake contents here
      }
    );
}
