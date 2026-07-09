{...}: self: super: {
  # nixpkgs lags behind upstream releases; pin to the latest apple/container release.
  container = super.container.overrideAttrs (old: rec {
    version = "1.1.0";
    src = super.fetchurl {
      url = "https://github.com/apple/container/releases/download/${version}/container-${version}-installer-signed.pkg";
      hash = "sha256-DKHEKiJpwlV++x2CsbOKxVPmo6PaGxF5xDm87h59ZxQ=";
    };

    nativeBuildInputs = old.nativeBuildInputs ++ [super.makeWrapper];

    # `container` locates its plugins (libexec/container/plugins) relative to its own binary path without resolving symlinks.
    # Under home-manager it's invoked through /etc/profiles/.../bin, a profile symlink that doesn't mirror libexec, so plugin discovery silently fails.
    # Pin the real store path explicitly instead.
    postInstall =
      old.postInstall
      + ''
        wrapProgram $out/bin/container --set CONTAINER_INSTALL_ROOT "$out"
      '';
  });
}
