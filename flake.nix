{
  description = "A very basic flake";

  inputs = {
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
