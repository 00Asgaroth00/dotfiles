{lib, pkgs, ...}: {
  home.packages = with pkgs; [
    file
    # nerdfonts
    ffmpegthumbnailer
    ueberzugpp
    # zoxide
    # xclip
    # xsel
    exiftool
  ];

  xdg.configFile."yazi/yazi.toml".source = ./yazi.toml;
  xdg.configFile."yazi/keymap.toml".source = ./keymap.toml;
  xdg.configFile."yazi/theme.toml".source = ./theme.toml;

  programs.yazi = {
    enable = true;
    package = pkgs.yazi;
    enableZshIntegration = true;
    # keymap = {};
    # settings = {};
    # theme = {};
  };
}
