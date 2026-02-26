{flake, ...}: let
  inherit (flake.config) opt;
in {
  programs = {
    fzf.enable = true;
    eza.enable = true;

    zoxide = {
      enable = true;

      enableZshIntegration = !opt.enableFish;
      enableFishIntegration = opt.enableFish;
    };

    starship = {
      enable = true;

      enableZshIntegration = !opt.enableFish;
      enableFishIntegration = opt.enableFish;

      settings = fromTOML (builtins.readFile ./starship.toml);
    };
  };
}
