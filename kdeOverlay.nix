(final: prev: {
  kdePackages = prev.kdePackages.overrideScope (
    self: super: {
      plasma-desktop = super.plasma-desktop.overrideAttrs (
        plasmaPrev: plasmaSuper: {
          patches =
            let
              breezeModified = super.breeze.overrideAttrs (breezeSuper: {
                postInstall =
                  breezeSuper.postInstall
                  + ''
                    rm -rf $out/share/wallpapers/Next/contents/images
                    cp -r ${./.}/resource/breeze $out/share/wallpapers/Next/contents/images
                  '';
              });
              finalPatch = (
                (builtins.filter (
                  x: (!(builtins.isAttrs x) || ((x.name or "") != "wallpaper-paths.patch"))
                ) super.plasma-desktop.patches)
                ++ [
                  (final.replaceVars "${final.path}/pkgs/kde/plasma/plasma-desktop/wallpaper-paths.patch" {
                    wallpapers = "${final.lib.getBin breezeModified}/share/wallpapers";
                  })
                ]
              );
            in
            finalPatch;
        }
      );
      dolphin = super.dolphin.overrideAttrs (
        dolphinPrev: dolphinSuper: {
          patches = (super.dolphin.patches or [ ]) ++ [
            ./my-dolphin-patch.patch
          ];
        }
      );
    }
  );
})
