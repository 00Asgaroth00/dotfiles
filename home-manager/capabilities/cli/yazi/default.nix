{lib, pkgs, ...}: {
  home.packages = with pkgs; [
    exiftool
    file
    ffmpegthumbnailer
    # nerdfonts
    # ueberzugpp
    # zoxide
    # xclip
    # xsel
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
