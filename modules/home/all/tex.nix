{pkgs, ...}: {
  home.packages = [
    pkgs.tectonic

    pkgs.texlab
    pkgs.bibtool
  ];
}
