{
  flake,
  pkgs,
  ...
}: let
  inherit (flake.config) opt;

  nerdFontSymbolsPreset = pkgs.fetchurl {
    url = "https://starship.rs/presets/toml/nerd-font-symbols.toml";
    hash = "sha256-uEgo0X18vjxhTAteue5ROnNAmLExsP5y5EkV94tqjOw=";
  };
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

      settings = fromTOML (builtins.readFile nerdFontSymbolsPreset);
    };
  };
}
