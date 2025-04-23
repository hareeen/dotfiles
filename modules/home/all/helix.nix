{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "amberwood";
      editor = {
        bufferline = "multiple";
        cursor-shape = {
          insert = "bar";
          select = "underline";
        };
        indent-guides.render = true;
        lsp.display-inlay-hints = true;
      };
    };
    languages = {
      language = [
        {
          name = "rust";
          auto-format = true;
          formatter.command = "rustfmt";
        }
        {
          name = "nix";
          auto-format = true;
          formatter.command = "alejandra";
        }
      ];
    };
  };
}
