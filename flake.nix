{
  description = "A very basic flake";

  inputs = {
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
