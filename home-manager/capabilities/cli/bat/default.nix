{ pkgs, ... }: {

  # enhanced cat

  programs.bat = {
    enable = true;
    config = {
      theme = "tokyonight_night";
    };
  };

  xdg.configFile."bat/themes/tokyonight_night.tmTheme".source =
    pkgs.fetchFromGitHub
    {
      owner = "folke";
      repo = "tokyonight.nvim";

      rev = "v3.0.1";
      sha256 = "sha256-QKqCsPxUyTur/zOUZdiT1cOMSotmTsnOl/3Sn2/NlUI";

    }
    + "/extras/sublime/tokyonight_night.tmTheme"; 

}
