# default.nix
let 
  pkgs = import <nixpkgs> { };
in 
  pkgs.haskellPackages.developPackage {
    root = ./.;
    source-overrides = {
      dbf = builtins.fetchGit { 
	url = "https://github.com/fstuess/binary-bits.git";
      };
    };
    modifier = drv:
      pkgs.haskell.lib.addBuildTools drv (with pkgs.haskellPackages;
        [ cabal-install
          ghcid
        ]);
  }