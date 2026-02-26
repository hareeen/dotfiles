{inputs, ...}: {
  imports = [(inputs.git-hooks + /flake-module.nix)];
  perSystem = {
    config,
    pkgs,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      name = "dotfiles-shell";
      meta.description = "Dev environment for dotfiles";
      inputsFrom = [config.pre-commit.devShell];
      packages = with pkgs; [
        nixd
        nil
        nix-output-monitor
        alejandra

        just
      ];
    };

    pre-commit.settings = {
      hooks.alejandra.enable = true;
    };
  };
}
