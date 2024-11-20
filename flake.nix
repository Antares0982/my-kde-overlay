{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      overlay = import ./breezeOverlay.nix;
    in
    {
      overlays.default = overlay;
    };
}
