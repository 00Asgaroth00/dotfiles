{...}: {
  programs.eza = {
    enable = true;
    # enableAliases = true;
    enableZshIntegration = true;
    # icons = true;
    icons = "auto";
    extraOptions = ["--group-directories-first" "--header"];
    git = true;
  };
}
