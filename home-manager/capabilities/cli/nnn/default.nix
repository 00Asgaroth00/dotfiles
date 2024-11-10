{ pkgs, ... }: {

  programs.nnn = {
    package = pkgs.nnn.override ({ withNerdIcons = true; extraMakeFlags = [ "O_NAMEFIRST=1" ]; });
    enable = true;
    bookmarks = {
      d = "~/Documents";
      o = "~/Downloads";
      # n = "~/50-59-Reference/";
      # f = "~/10-19-Life/10-Finance/10.12-Statements/$(date +%Y)";
      # w = "~/80-89-Media/80-Pictures/80.10-Wallpapers";
    };
    plugins = {
      mappings = {
        p = "preview-tui";
      };
      src = (pkgs.fetchFromGitHub {
        owner = "jarun";
        repo = "nnn";
        rev = "master";
        sha256 = "sha256-jziENmyN4OcyWBM2vx2PhpS07QFbkm9J3sn5rer8z64=";
        # sha256 = "sha256-1AgOzmnEPnycYf/YbPvcHV1O+vGlcddHCoIkgpbcbv0=";
      }) + "/plugins";
    };
  };

}
