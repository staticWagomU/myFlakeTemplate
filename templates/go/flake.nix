{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            go
            gopls
            gotools
            go-tools

            air
            delve
            golangci-lint
          ];

          shellHook = ''
            echo "Go development environment loaded!"
            echo "Go version: $(go version)"
            echo ""
            echo "Available tools:"
            echo "  - go: Go compiler and toolchain"
            echo "  - gopls: Go language server"
            echo "  - air: Live reload for Go apps"
            echo "  - delve: Go debugger"
            echo "  - golangci-lint: Go linter"
          '';
        };
      });
}
