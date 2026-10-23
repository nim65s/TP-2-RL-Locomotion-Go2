{
  inputs.nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.zst";

  outputs = inputs: {
    devShells = builtins.mapAttrs (_system: pkgs: {
      default = pkgs.mkShell {
        env.LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
          pkgs.glfw
          pkgs.libglvnd
        ];
      };
    }) inputs.nixpkgs.legacyPackages;
  };
}
