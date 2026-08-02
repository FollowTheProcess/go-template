_: {
  perSystem =
    { pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          go
          golangci-lint
          goperf
          gopls
          goreleaser
          gotools
          mise
          nilaway
          nix-update
          pkgsite
          typos
        ];

        shellHook = ''
          echo "👋🏻 Welcome to the project devShell!"
        '';
      };
    };
}
