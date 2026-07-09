{...}: self: super: {
  # nixpkgs lags behind upstream releases; pin to the latest apple/container release.
  container = super.container.overrideAttrs (old: rec {
    version = "1.1.0";
    src = super.fetchurl {
      url = "https://github.com/apple/container/releases/download/${version}/container-${version}-installer-signed.pkg";
      hash = "sha256-DKHEKiJpwlV++x2CsbOKxVPmo6PaGxF5xDm87h59ZxQ=";
    };
  });
}
