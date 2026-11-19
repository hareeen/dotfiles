{ pkgs, ... }: {
  imports = [
    ./dev/ocaml.nix
    ./dev/rust.nix
  ];

  home.packages = with pkgs; [
    uv
    ruff
    ty

    nodejs
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
    clang-tools
    neocmakelsp

    marksman
    taplo
    yaml-language-server
    vscode-langservers-extracted
    bash-language-server
    fish-lsp
    typos-lsp

    yazi
    lazygit
  ];
}
