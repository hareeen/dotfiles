{
  programs.mise = {
    enable = true;
    enableFishIntegration = true;
    globalConfig = {
      tools = {
        node = "lts";
        go = "latest";
        bun = "latest";
        deno = "latest";
        usage = "latest";
      };
    };
  };
}
