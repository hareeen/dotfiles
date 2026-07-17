{pkgs, ...}: {
  imports = [
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
    alejandra

    julia-bin

    gleam
    erlang
    rebar3

    cmake
  ];
}
