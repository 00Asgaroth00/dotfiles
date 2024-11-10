{
  lib,
  pkgs,
  ...
}: {
  programs.btop = {
    enable = true;
    settings = {
      color_theme = lib.mkDefault "tokyo-night";
      vim_keys = true;
    };
  };

  xdg.configFile."btop/themes/tokyo-night.theme".source =
    pkgs.fetchFromGitHub
    {
      owner = "aristocratos";
      repo = "btop";
      rev = "master";
      sha256 = "sha256-zvDwuTKH2/wdgqp2JPc01VCqWtA67fdj1OVqwGri+JU=";
      #sha256 = "sha256-XagMW45T8gHb2dfHbyXidPgQGg96wq9kko5rosCXijg=";
    }
    + "/themes/tokyo-night.theme";
}
