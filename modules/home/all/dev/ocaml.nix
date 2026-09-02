{ pkgs, ... }: {
  home.packages = with pkgs.ocamlPackages; [
    ocaml
    dune_3
    findlib
    ocaml-lsp
    ocamlformat
    utop
  ];
}
