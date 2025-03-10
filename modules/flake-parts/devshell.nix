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

        # for managing generations
        home-manager

        just
      ];

      shellHook = ''
        if [ -z "$IN_NIX_SHELL" ]; then
          export IN_NIX_SHELL=1
          exec ${pkgs.fish}/bin/fish
        fi
      '';
    };

    pre-commit.settings = {
      hooks.alejandra.enable = true;
    };
  };
}
