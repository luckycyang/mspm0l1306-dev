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
          embed = pkgs.mkShell.override {stdenv = pkgs.clangStdenv;} {
            name = "embed";
            buildInputs = with pkgs; [
              openocd
              gnumake
              ninja
              cmake
              gcc-arm-embedded
              rocmPackages.llvm.clang-tools-extra
              rocmPackages.llvm.llvm
            ];
          };
          default = embed;
        };
        # flake contents here
      }
    );
}
