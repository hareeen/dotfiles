{ pkgs, ... }: {
  imports = [
    ./dev/ocaml.nix
    ./dev/rust.nix
  ];

  home.packages = with pkgs; [
    uv
    ruff
    ty

    nodejs-slim
    bun

    go
    gopls

    nil
    nixd
    nixfmt

    julia-bin

    gleam
    beamPackages.erlang
    rebar3

    cmake
  ];
}
