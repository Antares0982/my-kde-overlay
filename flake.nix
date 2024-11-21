{
  description = "My KDE overlay flake";

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
