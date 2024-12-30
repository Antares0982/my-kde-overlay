{
  description = "My KDE overlay flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      overlay = import ./kdeOverlay.nix;
    in
    {
      overlays.default = overlay;
    };
}
