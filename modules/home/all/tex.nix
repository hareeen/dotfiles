{pkgs, ...}: let
  tex = pkgs.texlive.combine {
    inherit
      (pkgs.texlive)
      scheme-full
      ;
  };
in {
  home.packages = [
    tex
    pkgs.texlab
    pkgs.bibtool
  ];
}
