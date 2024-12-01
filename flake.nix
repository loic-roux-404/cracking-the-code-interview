{
  description = "Nix configurations for a k8s paas build";

  inputs = {
    # Package sets
    nixpkgs.url = "github:NixOS/nixpkgs/24.11-pre";

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
        node18PnpmPackages = with stablePkgs; (nodePackages.pnpm.override { nodejs = nodejs_18; });
       in
        {
          default = stablePkgs.mkShell {
            name = "default";
            buildInputs = stablePkgs.lib.attrValues {
              inherit (stablePkgs) nodejs_18;
            } ++ [ node18PnpmPackages ];
            nativeBuildInputs = stablePkgs.lib.attrValues {
              inherit (stablePkgs) nil
              go go-outline gopls gopkgs go-tools delve;
            };
            packages = stablePkgs.lib.attrValues {
              inherit (stablePkgs) exercism
              rustc cargo;
            };
            shellHook = ''
              [ "$(exercism workspace)" = "$PWD" ] && echo -n || exercism configure -w "$PWD"
            '';
          };
        };
    });
}
# vim: foldmethod=marker
