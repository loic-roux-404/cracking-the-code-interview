{
  description = "Nix configurations for a k8s paas build";

  inputs = {
    # Package sets
    nixpkgs.url = "github:NixOS/nixpkgs/24.05";

    # Flake utilities
    flake-compat = { url = "github:edolstra/flake-compat"; flake = false; };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, flake-utils, ... }@inputs:
    let
      nixpkgsDefaults = {
        config = {
          allowUnfree = true;
        };
      };
    in
    {

      overlays = {
        pkgs-stable = _: prev: {
          pkgs-stable = import inputs.nixpkgs {
            inherit (prev.stdenv) system;
            inherit (nixpkgsDefaults) config;
          };
        };

        tweaks = _: _: {
          # Add temporary overrides here
        };
      };
    }
    // flake-utils.lib.eachDefaultSystem (baseSystem:
    {
      devShells = let 
        system = baseSystem;
        stablePkgs = import inputs.nixpkgs (nixpkgsDefaults // { inherit system; });
       in
        {
          default = stablePkgs.mkShell {
            name = "default";
            packages = stablePkgs.lib.attrValues {
              inherit (stablePkgs) exercism;
            };
            shellHook = ''
            '';
          };
        };
    });
}
# vim: foldmethod=marker
